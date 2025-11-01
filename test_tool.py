import tkinter as tk
from tkinter import ttk

root = tk.Tk()
root.title("Test Tabs")
root.geometry("400x300")

# Create notebook (tabs)
notebook = ttk.Notebook(root)
notebook.pack(fill="both", expand=True)

# Add tabs
for name in ["Item", "Trainer", "Object"]:
    frame = ttk.Frame(notebook)
    notebook.add(frame, text=name)
    tk.Label(frame, text=f"This is the {name} tab").pack(pady=20)

root.mainloop()
