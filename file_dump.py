import os
import re
import random

root_dir = "."
output_file = "dialogue_dump.txt"

dialogue_pattern = re.compile(
    r'msgbox\(\s*"((?:[^"\\]|\\.)*)"\s*(?:,\s*MSGBOX_[A-Z_]+)?\s*\)',
    re.DOTALL
)

string_pattern = re.compile(r'"((?:[^"\\]|\\.)*)"')

dialogue_lines = []
move_descriptions = []

# -------- Find and extract msgbox dialogue --------
for dirpath, dirnames, filenames in os.walk(root_dir):
    normalized = dirpath.replace("\\", "/")

    if normalized.endswith("data/maps"):
        for subdir, _, files in os.walk(dirpath):
            if "scripts.pory" in files:
                script_path = os.path.join(subdir, "scripts.pory")

                with open(script_path, "r", encoding="utf-8") as f:
                    content = f.read()

                matches = dialogue_pattern.findall(content)

                for text in matches:
                    text = text.replace("\\n", " ")
                    text = text.replace("\\p", " ")
                    text = text.replace("\\l", " ")
                    text = re.sub(r"\s+", " ", text).strip()

                    dialogue_lines.append(text)

# -------- Randomize dialogue order --------
random.shuffle(dialogue_lines)

# -------- Extract move descriptions --------
move_file = os.path.join(root_dir, "src", "move_descriptions.c")

if os.path.exists(move_file):
    with open(move_file, "r", encoding="utf-8") as f:
        content = f.read()

    matches = string_pattern.findall(content)

    for text in matches:
        text = text.replace("\\n", " ")
        text = re.sub(r"\s+", " ", text).strip()

        move_descriptions.append(text)

# -------- Randomize move descriptions --------
random.shuffle(move_descriptions)

# -------- Write output --------
with open(output_file, "w", encoding="utf-8") as out:
    for line in dialogue_lines:
        out.write(line + "\n")

    out.write("\n* * * MOVE DESCRIPTIONS * * *\n\n")

    for line in move_descriptions:
        out.write(line + "\n")

print(f"Extracted {len(dialogue_lines)} dialogue lines and {len(move_descriptions)} move descriptions.")
print(f"Output written to {output_file}")