import os
import re
import tkinter as tk
from tkinter import filedialog, ttk

class TrainerApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Trainer Information App")
        self.folder_path = ""
        self.create_widgets()

    def create_widgets(self):
        # Create a frame for the file selection
        frame = tk.Frame(self.root)
        frame.pack(pady=10)

        # Create a button to open the folder
        self.open_button = tk.Button(frame, text="Open Folder", command=self.open_folder)
        self.open_button.pack(side=tk.LEFT, padx=10)

        # Create a dropdown for trainers
        self.trainer_var = tk.StringVar()
        self.trainer_dropdown = ttk.Combobox(frame, textvariable=self.trainer_var)
        self.trainer_dropdown.pack(side=tk.LEFT, padx=10)

        # Create a button to show trainer info
        self.show_button = tk.Button(frame, text="Show Trainer Info", command=self.show_trainer_info)
        self.show_button.pack(side=tk.LEFT, padx=10)

        # Create a text widget to display the trainer info
        self.info_text = tk.Text(self.root, wrap=tk.WORD, width=80, height=20)
        self.info_text.pack(pady=10)

    def open_folder(self):
        self.folder_path = filedialog.askdirectory()
        if self.folder_path:
            self.find_trainers(self.folder_path)

    def find_trainers(self, folder_path):
        constants_file_path = os.path.join(folder_path, 'include', 'constants', 'opponents.h')
        if os.path.isfile(constants_file_path):
            trainers = self.extract_trainers(constants_file_path)
            self.trainer_dropdown['values'] = trainers

    def extract_trainers(self, file_path):
        trainers = []
        with open(file_path, 'r') as file:
            for line in file:
                if line.startswith('#define TRAINER_'):
                    trainer_name = line.split()[1].replace('TRAINER_', '').replace('_', ' ').title()
                    trainers.append(trainer_name)
        return trainers

    def show_trainer_info(self):
        selected_trainer = self.trainer_var.get().upper().replace(' ', '_')
        if self.folder_path:
            trainer_file_path = os.path.join(self.folder_path, 'src', 'data', 'trainers.h')
            if os.path.isfile(trainer_file_path):
                trainer_info = self.extract_trainer_info(trainer_file_path, selected_trainer)
                self.display_trainer_info(trainer_info)

    def extract_trainer_info(self, file_path, trainer_name):
        trainer_info = {}
        with open(file_path, 'r') as file:
            data = file.read()
            pattern = re.compile(rf'\[TRAINER_{trainer_name}\]\s*=\s*\{{(.*?)\}}', re.DOTALL)
            match = pattern.search(data)
            if match:
                trainer_data = match.group(1)
                trainer_info['trainerClass'] = self.extract_value(trainer_data, r'\.trainerClass\s*=\s*(\w+)')
                trainer_info['encounterMusic'] = self.extract_value(trainer_data, r'\.encounterMusic_gender\s*=\s*(\w+)')
                trainer_info['trainerPic'] = self.extract_value(trainer_data, r'\.trainerPic\s*=\s*(\w+)')
                trainer_info['trainerName'] = self.extract_value(trainer_data, r'\.trainerName\s*=\s*_\("([^"]+)"\)')
                trainer_info['items'] = self.extract_value(trainer_data, r'\.items\s*=\s*\{(.*?)\}', is_list=True)
                trainer_info['doubleBattle'] = self.extract_value(trainer_data, r'\.doubleBattle\s*=\s*(\w+)')
                trainer_info['aiFlags'] = self.extract_value(trainer_data, r'\.aiFlags\s*=\s*(\w+)')
                trainer_info['partyType'] = self.extract_value(trainer_data, r'\.party\s*=\s*(\w+)\(')
                trainer_info['partyLocation'] = self.extract_value(trainer_data, r'\.party\s*=\s*\w+\((.*?)\)')
        return trainer_info

    def extract_value(self, data, pattern, is_list=False):
        match = re.search(pattern, data)
        if match:
            value = match.group(1).strip()
            if is_list:
                return [item.strip() for item in value.split(',')] if value else []
            return value
        return None

    def display_trainer_info(self, trainer_info):
        self.info_text.delete(1.0, tk.END)
        if trainer_info:
            self.info_text.insert(tk.END, f"Trainer Class: {trainer_info['trainerClass']}\n")
            self.info_text.insert(tk.END, f"Encounter Music: {trainer_info['encounterMusic']}\n")
            self.info_text.insert(tk.END, f"Trainer Pic: {trainer_info['trainerPic']}\n")
            self.info_text.insert(tk.END, f"Trainer Name: {trainer_info['trainerName']}\n")
            items = trainer_info['items'] if trainer_info['items'] else ["None"]
            self.info_text.insert(tk.END, f"Items: {', '.join(items)}\n")
            self.info_text.insert(tk.END, f"Double Battle: {trainer_info['doubleBattle']}\n")
            self.info_text.insert(tk.END, f"AI Flags: {trainer_info['aiFlags']}\n")
            self.info_text.insert(tk.END, f"Party Type: {trainer_info['partyType']}\n")
            self.info_text.insert(tk.END, f"Party Location: {trainer_info['partyLocation']}\n")
        else:
            self.info_text.insert(tk.END, "Trainer not found.")

if __name__ == "__main__":
    root = tk.Tk()
    app = TrainerApp(root)
    root.mainloop()
