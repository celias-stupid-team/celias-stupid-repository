import tkinter as tk
from tkinter import ttk
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parent

# =========================
# File helpers
# =========================

def read_lines(path):
    with open(path, "r", encoding="utf-8") as f:
        return f.readlines()

# =========================
# Readers
# =========================

def read_move_types():
    path = ROOT_DIR / "include/constants/pokemon.h"
    lines = read_lines(path)

    types = []
    in_block = False

    for line in lines:
        line = line.strip()

        if line.startswith("#define TYPE_NONE"):
            in_block = True

        if not in_block:
            continue

        if line.startswith("#define NUMBER_OF_MON_TYPES"):
            break

        if line.startswith("#define"):
            parts = line.split()
            if len(parts) >= 2:
                types.append(parts[1].replace("TYPE_", ""))

    return types


def read_move_effects():
    path = ROOT_DIR / "include/constants/battle_move_effects.h"
    lines = read_lines(path)

    effects = []

    for line in lines:
        line = line.strip()

        if line.startswith("#endif"):
            break

        if line.startswith("#define"):
            parts = line.split()
            if len(parts) >= 2:
                effects.append(parts[1].replace("EFFECT_", ""))

    return effects


def read_move_targets():
    return [
        "MOVE_TARGET_SELECTED",
        "MOVE_TARGET_USER_OR_SELECTED",
        "MOVE_TARGET_RANDOM",
        "MOVE_TARGET_BOTH",
        "MOVE_TARGET_USER",
        "MOVE_TARGET_FOES_AND_ALLY",
        "MOVE_TARGET_OPPONENTS_FIELD",
        "MOVE_TARGET_ALLY",
    ]


def read_animations():
    path = ROOT_DIR / "data/battle_anim_scripts.s"
    lines = read_lines(path)

    anims = []
    in_block = False

    for line in lines:
        line = line.strip()

        if line.startswith("gBattleAnims_Moves::"):
            in_block = True
            continue

        if not in_block:
            continue

        if "Move_COUNT" in line:
            break

        if line.startswith(".4byte"):
            parts = line.split()
            if len(parts) >= 2 and parts[1].startswith("Move_"):
                anims.append(parts[1].replace("Move_", ""))

    return anims

# =========================
# Validation / stub writers
# =========================

def validate_all_paths():
    required = [
        "include/constants/moves.h",
        "src/move_descriptions.c",
        "data/battle_anim_scripts.s",
        "src/data/battle_moves.h",
        "src/data/text/move_names.h",
    ]
    for rel in required:
        if not (ROOT_DIR / rel).exists():
            return False, f"Missing required file: {rel}"
    return True, None


def write_all_files(data):
    # stub
    pass

# =========================
# Autocomplete dropdown widget
# =========================

class AutocompleteDropdown(ttk.Frame):
    def __init__(self, parent, values, textvariable, width=30):
        super().__init__(parent)

        self.values = list(values)  # preserve definition order
        self.filtered = []
        self.var = textvariable

        self.entry = ttk.Entry(self, textvariable=self.var, width=width)
        self.entry.pack(fill="x")

        self.listbox = tk.Listbox(
            self,
            height=6,
            exportselection=False
        )
        self.listbox.pack(fill="x")
        self.listbox.pack_forget()

        self.entry.bind("<KeyRelease>", self.on_keyrelease)
        self.entry.bind("<Down>", self.move_selection)
        self.entry.bind("<Tab>", self.accept_selection)
        self.entry.bind("<Return>", self.accept_selection)

        self.listbox.bind("<Return>", self.accept_selection)
        self.listbox.bind("<Tab>", self.accept_selection)
        self.listbox.bind("<Escape>", self.hide)
        self.listbox.bind("<Up>", self.move_selection)
        self.listbox.bind("<Down>", self.move_selection)
        self.listbox.bind("<ButtonRelease-1>", self.accept_selection)

    def on_keyrelease(self, event):
        if event.keysym in ("Up", "Down", "Return", "Escape", "Tab"):
            return

        typed = self.var.get().upper()

        if not typed:
            self.filtered = []
            self.hide()
            return

        self.filtered = [v for v in self.values if v.startswith(typed)]
        self.update_listbox()

    def update_listbox(self):
        self.listbox.delete(0, tk.END)

        if not self.filtered:
            self.hide()
            return

        for v in self.filtered:
            self.listbox.insert(tk.END, v)

        self.listbox.selection_clear(0, tk.END)
        self.listbox.selection_set(0)
        self.listbox.pack(fill="x")

    def move_selection(self, event):
        if not self.listbox.winfo_ismapped():
            return

        cur = self.listbox.curselection()
        if not cur:
            index = 0
        else:
            index = cur[0]

        if event.keysym == "Down":
            index = min(index + 1, self.listbox.size() - 1)
        elif event.keysym == "Up":
            index = max(index - 1, 0)

        self.listbox.selection_clear(0, tk.END)
        self.listbox.selection_set(index)
        self.listbox.activate(index)
        return "break"

    def accept_selection(self, event=None):
        if not self.listbox.winfo_ismapped():
            return

        selection = self.listbox.curselection()
        if not selection:
            return

        value = self.listbox.get(selection[0])
        self.var.set(value)
        self.hide()
        self.entry.icursor(tk.END)
        self.entry.focus_set()
        return "break"

    def hide(self, event=None):
        self.listbox.pack_forget()

# =========================
# GUI
# =========================

class MoveInserterApp(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Move Inserter")
        self.resizable(False, False)

        self.vars = {}
        self.last_submission = None

        self._build_ui()

    def _build_ui(self):
        main = ttk.Frame(self, padding=10)
        main.grid(row=0, column=0)

        # ---- Top controls ----
        top = ttk.Frame(main)
        top.grid(row=0, column=0, sticky="e")

        self.always_on_top = tk.BooleanVar()
        ttk.Checkbutton(
            top,
            text="Always On Top",
            variable=self.always_on_top,
            command=lambda: self.wm_attributes("-topmost", self.always_on_top.get())
        ).grid(row=0, column=0, padx=5)

        self.copy_clipboard = tk.BooleanVar()
        ttk.Checkbutton(
            top,
            text="Copy To Clipboard",
            variable=self.copy_clipboard
        ).grid(row=0, column=1)

        # ---- Form ----
        form = ttk.Frame(main)
        form.grid(row=1, column=0, pady=5)

        def field(label, row, var):
            ttk.Label(form, text=label).grid(row=row, column=0, sticky="w")
            e = ttk.Entry(form, textvariable=var, width=30)
            e.grid(row=row, column=1, pady=2)
            return e

        def autocomplete_field(label, row, values, var):
            ttk.Label(form, text=label).grid(row=row, column=0, sticky="w")
            w = AutocompleteDropdown(form, values, var)
            w.grid(row=row, column=1, pady=2, sticky="ew")

        self.vars["name"] = tk.StringVar()
        self.vars["name_short"] = tk.StringVar()
        self.vars["def_name"] = tk.StringVar()

        field("Name", 0, self.vars["name"])
        self.name_short_entry = field("Name Short", 1, self.vars["name_short"])
        field("Definition Name", 2, self.vars["def_name"])

        self.vars["power"] = tk.StringVar()
        self.vars["effect_chance"] = tk.StringVar()
        self.vars["priority"] = tk.StringVar()

        field("Power", 3, self.vars["power"])
        field("Effect Chance", 4, self.vars["effect_chance"])
        field("Priority", 5, self.vars["priority"])

        self.vars["type"] = tk.StringVar()
        self.vars["effect"] = tk.StringVar()
        self.vars["target"] = tk.StringVar()
        self.vars["anim"] = tk.StringVar()

        autocomplete_field("Type", 6, read_move_types(), self.vars["type"])
        autocomplete_field("Effect", 7, read_move_effects(), self.vars["effect"])
        autocomplete_field("Target", 8, read_move_targets(), self.vars["target"])
        autocomplete_field("Animation", 9, read_animations(), self.vars["anim"])

        # ---- Buttons ----
        btns = ttk.Frame(main)
        btns.grid(row=2, column=0, pady=5)

        ttk.Button(btns, text="←", width=3, command=self.restore_last).grid(row=0, column=0)
        ttk.Button(btns, text="INSERT", command=self.insert).grid(row=0, column=1, padx=5)

        # ---- Status ----
        self.status = tk.StringVar()
        ttk.Label(main, textvariable=self.status).grid(row=3, column=0, sticky="w")

        self.vars["name"].trace_add("write", self._update_name_short_state)
        self._update_name_short_state()

    def _update_name_short_state(self, *args):
        if len(self.vars["name"].get()) > 12:
            self.name_short_entry.config(state="normal")
        else:
            self.vars["name_short"].set("")
            self.name_short_entry.config(state="disabled")

    def collect_data(self):
        return {k: v.get() for k, v in self.vars.items()}

    def insert(self):
        self.status.set("")

        ok, err = validate_all_paths()
        if not ok:
            self.status.set(err)
            return

        data = self.collect_data()

        try:
            write_all_files(data)
        except Exception as e:
            self.status.set(str(e))
            return

        self.last_submission = data

        if self.copy_clipboard.get():
            self.clipboard_clear()
            self.clipboard_append(str(data))

        self.reset_fields()
        self.status.set("Insert successful.")

    def reset_fields(self):
        for v in self.vars.values():
            v.set("")
        self._update_name_short_state()

    def restore_last(self):
        if not self.last_submission:
            return
        for k, v in self.last_submission.items():
            self.vars[k].set(v)
        self._update_name_short_state()

# =========================
# Run
# =========================

if __name__ == "__main__":
    app = MoveInserterApp()
    app.mainloop()
