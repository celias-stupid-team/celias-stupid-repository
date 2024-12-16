import os
import shutil

# Define the paths to the folders
folder1 = r"C:\Users\Celia Dawn\Documents\Roms\Decomps\pokeemerald-expansion\graphics\pokemon"
folder2 = r"C:\Users\Celia Dawn\Documents\Roms\Decomps\celias-stupid-repository\graphics\pokemon"

# List all subfolders in Folder 1
subfolders1 = [f.name for f in os.scandir(folder1) if f.is_dir()]

# List all subfolders in Folder 2
subfolders2 = [f.name for f in os.scandir(folder2) if f.is_dir()]

# Copy subfolders from Folder 1 to Folder 2 if they don't exist in Folder 2
for subfolder in subfolders1:
    if subfolder not in subfolders2:
        src_path = os.path.join(folder1, subfolder)
        dst_path = os.path.join(folder2, subfolder)
        shutil.copytree(src_path, dst_path)
        print(f"Copied {subfolder} to {folder2}")
    else:
        print(f"Skipped {subfolder}, already exists in {folder2}")
