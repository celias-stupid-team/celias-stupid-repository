import tkinter as tk
from tkinter import ttk, filedialog, messagebox
from PIL import Image, ImageTk

MODE_SPECS = {"Item": (32, 32), "Trainer": (64, 64), "Object": (48, 48)}

# Functions for image handling
def load_image(mode, preview_label):
    filepath = filedialog.askopenfilename(filetypes=[("PNG Images", "*.png")])
    if not filepath:
        return
    try:
        img = Image.open(filepath)
        if img.mode != "P":
            raise ValueError("Image must be 16-color indexed (mode 'P').")
        if img.size != MODE_SPECS[mode]:
            raise ValueError(f"Image must be {MODE_SPECS[mode][0]}x{MODE_SPECS[mode][1]}")
        tk_img = ImageTk.PhotoImage(img)
        preview_label.config(image=tk_img, text="")
        preview_label.image = tk_img
    except Exception as e:
        messagebox.showerror("Invalid Image", str(e))
        preview_label.config(image="", text="No image loaded")
        preview_label.image = None

def insert_action(mode):
    messagebox.showinfo("Insert", f"Insert action triggered for mode: {mode}")

# Create main window
root = tk.Tk()
root.title("ROM Asset Inserter")
root.geometry("400x300")
root.resizable(False, False)

notebook = ttk.Notebook(root)
notebook.pack(fill="both", expand=True)

for mode in MODE_SPECS:
    frame = ttk.Frame(notebook)
    notebook.add(frame, text=mode)

    ttk.Label(frame, text="Name:").pack(pady=(10,0))
    ttk.Entry(frame).pack(pady=5)
    preview = ttk.Label(frame, text="No image loaded")
    preview.pack(pady=5)
    ttk.Button(frame, text="Browse for PNG",
               command=lambda m=mode, p=preview: load_image(m, p)).pack(pady=5)
    ttk.Button(frame, text="Insert
