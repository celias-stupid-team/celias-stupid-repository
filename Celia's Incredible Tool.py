import tkinter as tk
from tkinter import ttk, filedialog
import os
import ctypes

# --------------------------
# Field configuration
# --------------------------

TAB_CONFIG = {
    "Item": [
        {"label": "Display Name", "type": "entry", "default": lambda f: os.path.splitext(os.path.basename(f))[0].upper()},
        {"label": "Price", "type": "entry", "default": "500"},
        {"label": "Key Item", "type": "checkbox", "default": False},
    ],
    "Trainer Pic": [],
    "Object": [
        {"label": "Width", "type": "entry", "default": ""},
        {"label": "Walking", "type": "checkbox", "default": False},
        # Palette is now a dropdown. It uses 'palettes.txt' for additional options,
        # and starts with "New Palette" as the first option by default.
        {"label": "Palette", "type": "dropdown", "file": "palettes.txt", "default_list": ["New Palette"]},
    ],

    "Trainer": [
        {"label": "Class", "type": "dropdown", "file": "trainer_classes.txt"},
        {"label": "Pic", "type": "dropdown", "file": "trainer_pics.txt"},
        {"label": "Display Name", "type": "entry", "default": ""},
        {"label": "Double Battle", "type": "checkbox", "default": False},
        {"label": "Held Item", "type": "checkbox", "default": False},
        {"label": "Moves", "type": "checkbox", "default": False},
    ],
    "Sound": [],
    "Music": [
        {"label": "New Voicegroup", "type": "checkbox", "default": False},
    ],

}

# --------------------------
# Debug helper
# --------------------------
def log(msg):
    print(f"[DEBUG] {msg}")

# --------------------------
# Constants
# --------------------------
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
last_browse_dir = SCRIPT_DIR  # global
selected_midi_path = None
log(f"Script directory: {SCRIPT_DIR}")

# Minimize console window
try:
    hwnd = ctypes.windll.kernel32.GetConsoleWindow()
    if hwnd != 0:
        ctypes.windll.user32.ShowWindow(hwnd, 6)  # 6 = Minimize
        log("Console window minimized")
except Exception as e:
    log(f"Could not minimize console window: {e}")

# --------------------------
# Browse PNG function
# --------------------------
def browse_png_with_preview(preview_label, name_entry=None):
    global last_browse_dir
    log("Browse PNG clicked")
    try:
        from PIL import Image, ImageTk
        log("Pillow imported successfully")
    except ImportError:
        log("Pillow not installed")
        preview_label.config(text="Cannot load image")
        return

    try:
        filepath = filedialog.askopenfilename(
            initialdir=last_browse_dir,
            filetypes=[("PNG Images", "*.png")]
        )
        if not filepath:
            log("No file selected")
            return
        log(f"Selected file: {filepath}")
        last_browse_dir = os.path.dirname(filepath)

        img = Image.open(filepath)
        log(f"Opened image: {filepath}, size={img.size}, mode={img.mode}")
        img.thumbnail((100, 100))
        tk_img = ImageTk.PhotoImage(img)
        preview_label.config(image=tk_img, text="")
        preview_label.image = tk_img
        log("Image preview updated successfully")

        # Update Name entry
        if name_entry is not None:
            base_name = os.path.splitext(os.path.basename(filepath))[0].upper()
            name_entry.delete(0, tk.END)
            name_entry.insert(0, base_name)
            log(f"Name entry updated to: {base_name}")

        # Auto-fill contextual fields if defaults are callable or default_list exists
        if hasattr(preview_label, "field_vars"):
            for label, info in preview_label.field_vars.items():
                default = info.get("default")
                default_list = info.get("default_list")
                var = info.get("var")
                file_for_dropdown = info.get("file")  # may be None

                # If default is callable, call it with the filepath
                if callable(default):
                    try:
                        value = default(filepath)
                        var.set(value)
                        log(f"Auto-filled {label} with: {value}")
                    except Exception as e:
                        log(f"Error auto-filling {label}: {e}")

                # If this field has a default_list (e.g. Palette: ["New Palette", ...]),
                # set the dropdown to the first default element (e.g. "New Palette")
                elif default_list:
                    # If it's a dropdown, ensure the combobox values include the defaults + file-values
                    if file_for_dropdown:
                        # combine existing stored values in dropdown_data (already loaded) and ensure default_list[0] is first
                        values = dropdown_data.get(file_for_dropdown, [])
                        # Prepend default_list items that aren't already present
                        for v in reversed(default_list):
                            if v not in values:
                                values.insert(0, v)
                        # update the combobox values widget if possible:
                        # locate combobox widget by searching children of preview_label's master frame
                        parent = preview_label.master
                        # find combobox widgets in that parent that are associated with this label var
                        for child in parent.winfo_children():
                            try:
                                # Combobox widget has cget method; compare textvariable if possible
                                if isinstance(child, ttk.Combobox):
                                    if str(child.cget("textvariable")) == str(var):
                                        child["values"] = values
                            except Exception:
                                pass
                    # set the var to the first default_list value
                    try:
                        var.set(default_list[0])
                        log(f"Set {label} to default_list[0]: {default_list[0]}")
                    except Exception as e:
                        log(f"Error setting default_list for {label}: {e}")


    except Exception as e:
        log(f"Error loading image: {e}")
        preview_label.config(text="No image loaded")

# --------------------------
# Browse Audio / MIDI
# --------------------------
def browse_audio(preview_label=None):
    global last_browse_dir
    log("Browse Audio clicked")
    filepath = filedialog.askopenfilename(
        initialdir=last_browse_dir,
        filetypes=[("Audio Files", "*.wav *.mp3 *.ogg")]
    )
    if filepath:
        last_browse_dir = os.path.dirname(filepath)
        log(f"Selected audio file: {filepath}")

def browse_midi(preview_label=None, name_entry=None):
    global last_browse_dir, selected_midi_path
    log("Browse MIDI clicked")
    filepath = filedialog.askopenfilename(
        initialdir=last_browse_dir,
        filetypes=[("MIDI Files", "*.mid *.midi")]
    )
    if not filepath:
        log("No file selected")
        return

    last_browse_dir = os.path.dirname(filepath)
    selected_midi_path = filepath
    log(f"Selected MIDI file: {filepath}")

    # Auto-fill the name entry (like Browse PNG)
    if name_entry is not None:
        base_name = os.path.splitext(os.path.basename(filepath))[0].upper()
        name_entry.delete(0, tk.END)
        name_entry.insert(0, base_name)
        log(f"Name entry updated to: {base_name}")



# --------------------------
# Dropdowns and contextual fields
# --------------------------
def load_dropdown_data():
    """
    Builds a dict mapping filename -> list of values.
    If a field provides 'default_list', those items become the initial values
    (kept in order) and then we append any lines read from the file.
    """
    dropdown_data = {}
    for tab, fields in TAB_CONFIG.items():
        for f in fields:
            if f.get("type") == "dropdown" and "file" in f:
                filename = f["file"]
                # Start with any provided default_list (e.g. ["New Palette"])
                base_values = []
                if isinstance(f.get("default_list"), list):
                    base_values = list(f["default_list"])
                # Read file lines (if present)
                file_values = []
                try:
                    with open(filename, "r", encoding="utf-8", newline="\r\n") as fp:
                        file_values = [line.strip() for line in fp if line.strip()]
                except FileNotFoundError:
                    log(f"[WARN] Missing dropdown file: {filename} (continuing with defaults)")
                dropdown_data[filename] = base_values + file_values
    return dropdown_data


def build_tab_fields(parent_frame, tab_name, field_vars, dropdown_data):
    # Dedicated subframe for the fields (allows parent to use pack)
    fields_frame = ttk.Frame(parent_frame)
    fields_frame.pack(fill="x", padx=5, pady=5)

    config = TAB_CONFIG.get(tab_name, [])
    row = 0

    for field in config:
        label_text = field["label"]
        tk.Label(fields_frame, text=label_text + ":").grid(row=row, column=0, sticky="w", padx=10, pady=3)

        default = field.get("default", "")
        # For dropdowns we may have a default_list (like ["New Palette"])
        default_list = field.get("default_list", None)

        # If default is callable (deferred), leave initial value blank
        if callable(default):
            initial_value = ""
        else:
            initial_value = default

        if field["type"] == "entry":
            var = tk.StringVar(value=initial_value)
            entry = tk.Entry(fields_frame, textvariable=var, width=20)
            entry.grid(row=row, column=1, sticky="w", padx=10, pady=3)
            field_vars[label_text] = {"var": var, "default": default, "default_list": default_list}

        elif field["type"] == "checkbox":
            var = tk.BooleanVar(value=bool(initial_value))
            cb = tk.Checkbutton(fields_frame, variable=var)
            cb.grid(row=row, column=1, sticky="w", padx=10, pady=3)
            field_vars[label_text] = {"var": var, "default": default, "default_list": default_list}

        elif field["type"] == "dropdown":
            var = tk.StringVar()
            filename = field.get("file")
            values = dropdown_data.get(filename, [])
            combo = ttk.Combobox(fields_frame, textvariable=var, values=values, width=20)
            combo.grid(row=row, column=1, sticky="w", padx=10, pady=3)
            combo["state"] = "normal"
            # If a default_list is specified and the combo has at least one entry,
            # we won't set the selection now (we defer setting selection until file load),
            # but we still store default_list metadata.
            field_vars[label_text] = {"var": var, "default": default, "default_list": default_list, "file": filename}

        row += 1

    # Ensure columns align nicely
    fields_frame.grid_columnconfigure(0, weight=0)
    fields_frame.grid_columnconfigure(1, weight=1)

    return fields_frame  # optional, if you want a reference

# --------------------------
# GUI Setup
# --------------------------
log("Creating main window")
root = tk.Tk()
root.title("Celia's Incredible Tool")
root.geometry("400x350")

log("Creating notebook (tabs)")
notebook = ttk.Notebook(root)
notebook.pack(fill="both", expand=True)

always_on_top_var = tk.BooleanVar(value=True)
def toggle_always_on_top():
    value = always_on_top_var.get()
    log(f"[DEBUG] toggle_always_on_top called, checkbox value: {value}")
    root.attributes("-topmost", value)
    log(f"[DEBUG] root.attributes('-topmost') set to: {value}")
toggle_always_on_top()

dropdown_data = load_dropdown_data()

# --------------------------
# Tabs
# --------------------------
tabs = ["Item", "Trainer Pic", "Object", "Trainer", "Sound", "Music"]

for name in tabs:
    log(f"Adding tab: {name}")
    frame = ttk.Frame(notebook)
    notebook.add(frame, text=name)

    # Top-left checkboxes
    tk.Checkbutton(frame, text="Always On Top", variable=always_on_top_var,
                   command=toggle_always_on_top).pack(anchor="nw")
    copy_to_clipboard_var = tk.BooleanVar()
    tk.Checkbutton(frame, text="Copy to Clipboard", variable=copy_to_clipboard_var,
                   command=lambda: log(f"Copy to Clipboard set to {copy_to_clipboard_var.get()}")).pack(anchor="nw")

    # Name entry
    tk.Label(frame, text="Name:").pack(pady=(10, 0))
    name_entry = tk.Entry(frame)
    name_entry.pack(pady=5)

    # Contextual fields
    field_vars = {}
    build_tab_fields(frame, name, field_vars, dropdown_data)

    # Browse buttons
    if name in ["Item", "Trainer Pic", "Object"]:
        preview_label = tk.Label(frame, text="No image loaded")
        preview_label.pack(pady=5)
        tk.Button(
            frame,
            text="Browse PNG",
            command=lambda p=preview_label, e=name_entry: browse_png_with_preview(p, e)
        ).pack(pady=5)
        preview_label.field_vars = field_vars

    elif name == "Sound":
        tk.Button(frame, text="Browse Audio", command=browse_audio).pack(pady=5)
    elif name == "Music":
        tk.Button(frame, text="Browse MIDI", command=lambda e=name_entry: browse_midi(name_entry=e)).pack(pady=5)

        status_label = tk.Label(frame, text="", fg="lime")
        status_label.pack(pady=2)

        tk.Button(
            frame,
            text="Insert",
            command=lambda e=name_entry, fv=field_vars, sl=status_label: handle_music_insert(e, fv, sl)
        ).pack(pady=5)






    # Insert button
    tk.Button(frame, text="Insert", command=lambda n=name: log(f"Insert clicked on {n} tab")).pack(pady=5)

# --------------------------
# Backend: Music insertion
# --------------------------

def handle_music_insert(name_entry, field_vars, status_label=None):
    """
    Called when Insert is pressed on the Music tab.
    """
    global selected_midi_path
    name = name_entry.get().strip()
    if not name:
        log("[ERROR] No name entered for Music insert.")
        if status_label:
            status_label.config(text="Error: No name entered.", fg="red")
        return
    if not selected_midi_path:
        log("[ERROR] No MIDI file selected.")
        if status_label:
            status_label.config(text="Error: No MIDI selected.", fg="red")
        return

    # Retrieve checkbox state
    new_voicegroup = field_vars["New Voicegroup"]["var"].get()
    log(f"Inserting music: {name}, MIDI: {selected_midi_path}, New Voicegroup={new_voicegroup}")

    insert_music(name, selected_midi_path, new_voicegroup)

    # Success feedback
    mus_constant = f"MUS_{name.upper()}"
    if status_label:
        status_label.config(text=f"{mus_constant} successfully inserted!", fg="lime")
        # Auto-clear message after 5 seconds
    if status_label:
        status_label.after(5000, lambda: status_label.config(text=""))





def insert_music(name, midi_path, new_voicegroup=False):
    """
    Master function to insert a music track.
    """
    log(f"=== Begin Music Insertion ===")
    mus_constant = f"MUS_{name.upper()}"
    log(f"Name: {name}, MIDI: {midi_path}, New Voicegroup: {new_voicegroup}")
    log(f"Generated constant: {mus_constant}")

    # Copy to clipboard if requested (based on currently active tab’s checkbox)
    try:
        if root.focus_get():  # only works if GUI active
            for tab in notebook.tabs():
                tab_text = notebook.tab(tab, "text")
                if tab_text == "Music":
                    frame = notebook.nametowidget(tab)
                    for child in frame.winfo_children():
                        if isinstance(child, tk.Checkbutton) and child.cget("text") == "Copy to Clipboard":
                            if child.var.get():
                                root.clipboard_clear()
                                root.clipboard_append(mus_constant)
                                log(f"Copied {mus_constant} to clipboard")
                            break
    except Exception as e:
        log(f"[WARN] Could not copy to clipboard: {e}")

    # Pass mus_constant down to individual file handlers
    update_songs_header(name, mus_constant)
    update_ld_script(name, mus_constant)
    update_song_table(name, mus_constant)
    update_midi_cfg(name, midi_path, mus_constant)
    update_debug_c(name, mus_constant)

    if new_voicegroup:
        log(f"Would create new voicegroup for {name}")

    log(f"=== Music insertion complete for {name} ===")




# ----- Individual file update stubs -----

def update_songs_header(name, mus_constant):
    """
    Edit .\\include\\constants\\songs.h:
      - Add new #define MUS_<NAME> after the last one
      - Increment ID by 1
      - Keep formatting consistent (one blank line before MUS_NONE)
      - Update END_MUS to reference the new one
    """
    path = os.path.join(SCRIPT_DIR, "include", "constants", "songs.h")
    if not os.path.exists(path):
        log(f"[ERROR] songs.h not found at {path}")
        return

    try:
        with open(path, "r", encoding="utf-8", newline="\r\n") as f:
            lines = f.readlines()

        # Locate the last MUS_ entry before MUS_NONE
        last_define_index = None
        last_number = None
        mus_none_index = None

        for i, line in enumerate(lines):
            if "#define MUS_NONE" in line:
                mus_none_index = i
                break
            if line.strip().startswith("#define MUS_"):
                parts = line.strip().split()
                if len(parts) >= 3 and parts[1].startswith("MUS_"):
                    last_define_index = i
                    try:
                        last_number = int(parts[2], 0)
                    except ValueError:
                        pass

        if mus_none_index is None or last_define_index is None:
            log("[ERROR] Could not find MUS_NONE or last MUS_ define.")
            return

        new_number = (last_number or 0) + 1
        new_define = f"#define {mus_constant} {new_number}\n"
        log(f"Adding new define: {new_define.strip()}")

        # Ensure there's exactly one blank line before MUS_NONE
        # Remove any trailing blank lines between the last define and MUS_NONE
        insert_index = mus_none_index
        while insert_index - 1 >= 0 and lines[insert_index - 1].strip() == "":
            insert_index -= 1
            lines.pop(insert_index)

        # Insert new define and one blank line before MUS_NONE
        lines.insert(insert_index, "\n")
        lines.insert(insert_index, new_define)

        # Update END_MUS to point to new constant
        for i, line in enumerate(lines):
            if line.startswith("#define END_MUS"):
                lines[i] = f"#define END_MUS {mus_constant}\n"
                log(f"Updated END_MUS to {mus_constant}")
                break

        with open(path, "w", encoding="utf-8", newline="\r\n") as f:
            f.writelines(lines)

        log(f"Updated {path} successfully.")
    except Exception as e:
        log(f"[ERROR] update_songs_header failed: {e}")





def update_ld_script(name, mus_constant): pass
def update_song_table(name, mus_constant): pass
def update_midi_cfg(name, midi_path, mus_constant): pass
def update_debug_c(name, mus_constant): pass



log("Starting main loop")
toggle_always_on_top()
root.mainloop()
log("GUI closed")
