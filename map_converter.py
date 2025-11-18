import os

root = "data/maps"  # replace [root] with the actual path

for dirpath, dirnames, filenames in os.walk(root):
    if "map.json" in filenames and "scripts.pory" not in filenames:
        folder_name = os.path.basename(dirpath)
        scripts_path = os.path.join(dirpath, "scripts.pory")

        with open(scripts_path, "w", encoding="utf-8") as f:
            f.write(f"mapscripts {folder_name}_MapScripts {{\n\n}}\n")

        print(f"Created scripts.pory in: {dirpath}")
