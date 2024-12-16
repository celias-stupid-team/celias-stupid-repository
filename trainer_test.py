import tkinter as tk
from tkinter import filedialog, simpledialog, messagebox
import os
import re

class TrainerApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Trainer Data Viewer")

        self.trainer_data = {}
        
        self.label = tk.Label(root, text="Select Repository Root Directory:")
        self.label.pack(pady=10)

        self.select_button = tk.Button(root, text="Select Directory", command=self.select_directory)
        self.select_button.pack(pady=10)

        self.entry_label = tk.Label(root, text="Enter Trainer Name:")
        self.entry_label.pack(pady=10)
        
        self.trainer_entry = tk.Entry(root, width=50)
        self.trainer_entry.pack(pady=10)

        self.search_button = tk.Button(root, text="Search Trainer", command=self.search_trainer)
        self.search_button.pack(pady=10)

        self.result_text = tk.Text(root, height=10, width=80)
        self.result_text.pack(pady=10)

    def select_directory(self):
        self.directory = filedialog.askdirectory()
        if self.directory:
            self.label.config(text=f"Selected Directory: {self.directory}")
            self.load_trainer_data()

    def load_trainer_data(self):
        trainer_file = os.path.join(self.directory, 'src/data/trainers.h')
        if os.path.isfile(trainer_file):
            with open(trainer_file, 'r') as file:
                content = file.read()
                self.trainer_data = self.parse_trainer_data(content)
        else:
            messagebox.showerror("Error", "trainer.h file not found in the selected directory.")

    def parse_trainer_data(self, content):
        trainer_data = {}
        pattern = re.compile(r'Trainer\s+(\w+)\s*=\s*\{\s*(.*?)\s*\};', re.DOTALL)
        matches = pattern.findall(content)
        for match in matches:
            trainer_name = match[0]
            trainer_info = match[1].replace('\n', '').replace('\t', '').strip()
            trainer_data[trainer_name] = trainer_info
        return trainer_data

    def search_trainer(self):
        trainer_name = self.trainer_entry.get()
        if trainer_name in self.trainer_data:
            self.result_text.delete(1.0, tk.END)
            self.result_text.insert(tk.END, self.trainer_data[trainer_name])
        else:
            messagebox.showinfo("Not Found", f"Trainer {trainer_name} not found in data.")

if __name__ == "__main__":
    root = tk.Tk()
    app = TrainerApp(root)
    root.mainloop()
