import os
import shutil

# Path to the base directory
base_dir = r"C:\Users\Celia Dawn\Documents\Roms\Decomps\celias-stupid-repository\graphics\pokemon"

# Path to the default footprint.png file
default_footprint = r"C:\Users\Celia Dawn\Documents\Roms\Decomps\celias-stupid-repository\graphics\pokemon\basculin\footprint.png"

# Walk through the directory
for root, dirs, files in os.walk(base_dir):
    # Check if footprint.png is in the current directory
    if "footprint.png" not in files:
        # Copy the default footprint.png to the current directory
        shutil.copy(default_footprint, root)
        print(f"Copied footprint.png to {root}")

print("Processing complete.")
