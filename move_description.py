#!/usr/bin/env python3

INPUT_PATH = "src/move_descriptions.c"
OUTPUT_PATH = "dummy_lines.txt"
SUBSTRING = '("Dummy")'

def main():
    try:
        with open(INPUT_PATH, "r", encoding="utf-8") as infile, \
             open(OUTPUT_PATH, "w", encoding="utf-8") as outfile:
            
            for line in infile:
                if SUBSTRING in line:
                    outfile.write(line)

        print(f"Done. Matching lines written to {OUTPUT_PATH}")

    except FileNotFoundError:
        print(f"Error: Could not find {INPUT_PATH}")

if __name__ == "__main__":
    main()