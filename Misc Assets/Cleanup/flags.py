import sys
import os
import re

def rename_unused_flag(new_name):
    new_name = new_name.upper()
    flags_file_path = "./include/constants/flags.h"
    
    if not os.path.isfile(flags_file_path):
        print(f"Error: The file '{flags_file_path}' does not exist.")
        return

    with open(flags_file_path, "r") as file:
        lines = file.readlines()

    flag_pattern = re.compile(r"#define (FLAG_0x[0-9A-F]{3})\s+(0x[0-9A-F]{3})")
    unused_flag = None
    updated_lines = []
    
    for line in lines:
        match = flag_pattern.search(line)
        if match and not unused_flag:
            flag_name = match.group(1)
            flag_hex = match.group(2)
            flag_int = int(flag_hex, 16)
            if flag_int >= 0x0D7:
                new_flag_name = f"FLAG_CSR_{new_name}"
                updated_line = line.replace(flag_name, new_flag_name)
                updated_lines.append(updated_line)
                unused_flag = True
            else:
                updated_lines.append(line)
        else:
            updated_lines.append(line)

    if unused_flag:
        with open(flags_file_path, "w") as file:
            file.writelines(updated_lines)
        print(f"Renamed flag to: FLAG_CSR_{new_name}")
    else:
        print("Error: No unused flags available.")

if __name__ == "__main__":
    if len(sys.argv) != 3 or sys.argv[1] != "setflag":
        print("Usage: python flags setflag [name]")
    else:
        new_name = sys.argv[2]
        rename_unused_flag(new_name)
