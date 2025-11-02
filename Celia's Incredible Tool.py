import tkinter as tk
from tkinter import ttk, filedialog
import os


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
log(f"Script directory: {SCRIPT_DIR}")
import ctypes

try:
    hwnd = ctypes.windll.kernel32.GetConsoleWindow()
    if hwnd != 0:
        # Minimize window
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

        # Update last directory
        last_browse_dir = os.path.dirname(filepath)

        # Load image
        img = Image.open(filepath)
        log(f"Opened image: {filepath}, size={img.size}, mode={img.mode}")
        img.thumbnail((100, 100))
        tk_img = ImageTk.PhotoImage(img)
        preview_label.config(image=tk_img, text="")
        preview_label.image = tk_img
        log("Image preview updated successfully")

        # -------------------------------
        # Update the Name entry
        # -------------------------------
        if name_entry is not None:
            base_name = os.path.splitext(os.path.basename(filepath))[0].upper()
            name_entry.delete(0, tk.END)
            name_entry.insert(0, base_name)
            log(f"Name entry updated to: {base_name}")

    except Exception as e:
        log(f"Error loading image: {e}")
        preview_label.config(text="No image loaded")


# --------------------------
# Browse Audio function
# --------------------------

def browse_audio(preview_label=None):
    log("Browse Audio clicked")
    filepath = filedialog.askopenfilename(
        initialdir=last_browse_dir,
        filetypes=[("Audio Files", "*.wav *.mp3 *.ogg")]
    )
    if filepath:
        log(f"Selected audio file: {filepath}")

        # -------------------------------
        # Update the Name entry
        # -------------------------------
        if name_entry is not None:
            base_name = os.path.splitext(os.path.basename(filepath))[0].upper()
            name_entry.delete(0, tk.END)
            name_entry.insert(0, base_name)
            log(f"Name entry updated to: {base_name}")

def browse_midi(preview_label=None):
    log("Browse MIDI clicked")
    filepath = filedialog.askopenfilename(
        initialdir=last_browse_dir,
        filetypes=[("MIDI Files", "*.mid *.midi")]
    )
    if filepath:
        log(f"Selected MIDI file: {filepath}")

        # -------------------------------
        # Update the Name entry
        # -------------------------------
        if name_entry is not None:
            base_name = os.path.splitext(os.path.basename(filepath))[0].upper()
            name_entry.delete(0, tk.END)
            name_entry.insert(0, base_name)
            log(f"Name entry updated to: {base_name}")



# --------------------------
# GUI Setup
# --------------------------
log("Creating main window")
root = tk.Tk()
root.title("Celia's Incredible Tool")
root.geometry("400x300")

log("Creating notebook (tabs)")
notebook = ttk.Notebook(root)
notebook.pack(fill="both", expand=True)
always_on_top_var = tk.BooleanVar(value=True)
def toggle_always_on_top():
    value = always_on_top_var.get()
    log(f"[DEBUG] toggle_always_on_top called, checkbox value: {value}")
    root.attributes("-topmost", value)
    log(f"[DEBUG] root.attributes('-topmost') set to: {value}")
toggle_always_on_top()  # sets window topmost according to initial value


# --------------------------
# Tabs
# --------------------------
tabs = ["Item", "Trainer Pic", "Object", "Trainer", "Sound", "Music"]

for name in tabs:
    log(f"Adding tab: {name}")
    frame = ttk.Frame(notebook)
    notebook.add(frame, text=name)

    # ---------------------------
    # Top-left checkboxes
    # ---------------------------
    tk.Checkbutton(frame, text="Always On Top", variable=always_on_top_var,
                   command=toggle_always_on_top).pack(anchor="nw")
    
    copy_to_clipboard_var = tk.BooleanVar()
    tk.Checkbutton(frame, text="Copy to Clipboard", variable=copy_to_clipboard_var,
                   command=lambda: log(f"Copy to Clipboard set to {copy_to_clipboard_var.get()}")).pack(anchor="nw")

    # ---------------------------
    # Name entry
    # ---------------------------
    tk.Label(frame, text="Name:").pack(pady=(10, 0))
    name_entry = tk.Entry(frame)
    name_entry.pack(pady=5)

    # ---------------------------
    # Browse button + preview for PNG tabs
    # ---------------------------
    if name in ["Item", "Trainer Pic", "Object"]:
        preview_label = tk.Label(frame, text="No image loaded")
        preview_label.pack(pady=5)

        tk.Button(
            frame,
            text="Browse PNG",
            command=lambda p=preview_label, e=name_entry: browse_png_with_preview(p, e)
        ).pack(pady=5)

    # ---------------------------
    # Browse buttons for audio/midi
    # ---------------------------
    elif name == "Sound":
        tk.Button(frame, text="Browse Audio", command=browse_audio).pack(pady=5)
    elif name == "Music":
        tk.Button(frame, text="Browse MIDI", command=browse_midi).pack(pady=5)

    # Trainer tab: no Browse button, no preview
    # (already handled by not matching any of the above)

    # ---------------------------
    # Insert button
    # ---------------------------
    tk.Button(frame, text="Insert", command=lambda n=name: log(f"Insert clicked on {n} tab")).pack(pady=5)





log("Starting main loop")
toggle_always_on_top()
root.mainloop()
log("GUI closed")
