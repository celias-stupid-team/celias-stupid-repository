import tkinter as tk
from tkinter import ttk
import re
import os

def sanitize_string(value):
    return ''.join(e for e in value if e.isalnum())

def handle_insert():
    global sanitized_name, uppercase_name, folder_name, species_number, truncated_name

    name = name_var.get()
    displayed_name = displayed_name_var.get()

    sanitized_name = sanitize_string(name)
    uppercase_name = sanitized_name.upper()
    folder_name = sanitized_name.lower()
    species_number = f"SPECIES_{uppercase_name}"
    truncated_name = displayed_name[:10].upper()

    data = {
        "Name": name,
        "Displayed Name": displayed_name,
        "Type 1": type1_var.get(),
        "Type 2": type2_var.get(),
        "HP": hp_var.get(),
        "Attack": attack_var.get(),
        "Defense": defense_var.get(),
        "Speed": speed_var.get(),
        "Special Attack": special_attack_var.get(),
        "Special Defense": special_defense_var.get(),
    }
    
    print("Received Data:", data)
    main_editor_function(data)

def main_editor_function(data):
    """Main function to process input and call the file-specific functions."""
    print("Processing input data...")

    edit_file_1(data)
    edit_file_2(data)
    edit_file_3(data)
    edit_file_4(data)
    edit_file_5(data)
    edit_file_6(data)
    edit_file_7(data)
    edit_file_8(data)
    edit_file_9(data)

def edit_file_1(data):
    print("Editing include/constants/hoenn_cries.h with", data)
    path = os.path.join("include", "constants", "hoenn_cries.h")

    with open(path, "r", encoding="utf-8") as f:
        file_content = f.read()

    matches = re.findall(r'=\s*(\d+),', file_content)
    last_index = int(matches[-1]) if matches else 0
    new_index = last_index + 1

    new_entry = f" CRY_{uppercase_name}      = {new_index},\n"
    updated_content = re.sub(r'\n+};', f"\n{new_entry}\n\n}};", file_content)

    with open(path, "w", encoding="utf-8", newline='\n') as f:
        f.write(updated_content)

def edit_file_2(data):
    print("Editing include/constants/species.h with", data)
    path = os.path.join("include", "constants", "species.h")

    with open(path, "r", encoding="utf-8") as f:
        file_content = f.read()

    match = re.search(r'#define\s+SPECIES_EGG\s+(\d+)', file_content)
    if not match:
        print("ERROR: Could not find SPECIES_EGG define.")
        return

    egg_index = int(match.group(1))
    new_define = f"#define {species_number} {egg_index}\n"
    updated_content = re.sub(
        r'(\n)#define\s+SPECIES_EGG\s+\d+',
        f"\\1{new_define}\n#define SPECIES_EGG {egg_index + 1}",
        file_content
    )

    with open(path, "w", encoding="utf-8", newline='\n') as f:
        f.write(updated_content)

def edit_file_3(data):
    print("Editing src/data/text/species_names.h with", data)
    path = os.path.join("src", "data", "text", "species_names.h")

    with open(path, "r", encoding="utf-8") as f:
        file_content = f.read()

    new_entry = f"    [{species_number}] = _(\"{truncated_name}\"),\n"
    updated_content = re.sub(r'\n};', f"\n{new_entry}}};", file_content)

    with open(path, "w", encoding="utf-8", newline='\n') as f:
        f.write(updated_content)

def edit_file_4(data):
    print("Editing src/data/graphics/pokemon.h with", data)
    path = os.path.join("src", "data", "graphics", "pokemon.h")

    with open(path, "a", encoding="utf-8", newline='\n') as f:
        f.write(f"// {data['Name']}\n")
        f.write(f"const u32 gMonFrontPic_{sanitized_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/front.4bpp.lz\");\n")
        f.write(f"const u32 gMonPalette_{sanitized_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/normal.gbapal.lz\");\n")
        f.write(f"const u32 gMonBackPic_{sanitized_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/back.4bpp.lz\");\n")
        f.write(f"const u32 gMonShinyPalette_{sanitized_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/shiny.gbapal.lz\");\n")
        f.write(f"const u8 gMonIcon_{sanitized_name}[] = INCBIN_U8(\"graphics/pokemon/{folder_name}/icon.4bpp\");\n")
        f.write(f"const u8 gMonFootprint_{sanitized_name}[] = INCBIN_U8(\"graphics/pokemon/{folder_name}/footprint.1bpp\");\n\n")

def edit_file_5(data):
    print("Editing include/graphics.h with", data)
    path = os.path.join("include", "graphics.h")

    with open(path, "a", encoding="utf-8", newline='\n') as f:
        f.write(f"// {data['Name']}\n")
        f.write(f"extern const u32 gMonFrontPic_{sanitized_name}[];\n")
        f.write(f"extern const u32 gMonPalette_{sanitized_name}[];\n")
        f.write(f"extern const u32 gMonBackPic_{sanitized_name}[];\n")
        f.write(f"extern const u32 gMonShinyPalette_{sanitized_name}[];\n")
        f.write(f"extern const u8 gMonFootprint_{sanitized_name}[];\n")
        f.write(f"extern const u8 gMonIcon_{sanitized_name}[];\n\n")

def edit_file_6(data):
    print("Editing sound/cry_tables.inc with", data)
    path = os.path.join("sound", "cry_tables.inc")

    with open(path, "r", encoding="utf-8") as f:
        content = f.read()

    # Append to gCryTable
    cry_pattern = r'(gCryTable::\s*\n(?:\s*cry\s+Cry_.*\n)+)'
    new_cry = f"\tcry Cry_{sanitized_name}\n"
    content = re.sub(cry_pattern, lambda m: m.group(1) + new_cry, content, count=1)

    # Append to gCryTable_Reverse
    reverse_pattern = r'(gCryTable_Reverse::\s*\n(?:\s*cry_reverse\s+Cry_.*\n)+)'
    new_reverse = f"\tcry_reverse Cry_{sanitized_name}\n"
    content = re.sub(reverse_pattern, lambda m: m.group(1) + new_reverse, content, count=1)

    with open(path, "w", encoding="utf-8", newline='\n') as f:
        f.write(content)

def edit_file_7(data):
    print("Editing sound/direct_sound_data.inc with", data)
    path = os.path.join("sound", "direct_sound_data.inc")

    with open(path, "a", encoding="utf-8", newline='\n') as f:
        f.write(f"Cry_{sanitized_name}::\\n")
        f.write(f"\t.incbin \"sound/direct_sound_samples/cries/{folder_name}.bin\"\\n\\n")
        f.write(f"\t.align 2\\n")


def edit_file_8(data):
    print("Editing src/data/pokemon/cry_ids.h with", data)
    path = os.path.join("src", "data", "pokemon", "cry_ids.h")

    with open(path, "r", encoding="utf-8") as f:
        file_content = f.read()

    new_entry = f"	[{species_number} - POKERAP2_MON_SPECIES_START] = CRY_{uppercase_name},\n"
    updated_content = re.sub(r'\n+\/\/End', f"\n{new_entry}\n\n\/\/End", file_content)

    with open(path, "w", encoding="utf-8", newline='\n') as f:
        f.write(updated_content)


def edit_file_9(data):
    print("Editing src/data/pokemon/level_up_learnset_pointers.h with", data)
    path = os.path.join("src", "data", "pokemon", "level_up_learnset_pointers.h")

    with open(path, "r", encoding="utf-8") as f:
        file_content = f.read()

    matches = re.findall(r'=\s*(\d+),', file_content)
    last_index = int(matches[-1]) if matches else 0
    new_index = last_index + 1

    new_entry = f"\t[{species_number}] = s{sanitized_name}LevelUpLearnset,\n"
    updated_content = re.sub(r'\n+};', f"\n{new_entry}\n\n}};", file_content)

    with open(path, "w", encoding="utf-8", newline='\n') as f:
        f.write(updated_content)

def edit_file_10(data):
    print("Editing src/data/pokemon/level_up_learnsets.h with", data)
    path = os.path.join("src", "data", "pokemon", "level_up_learnsets.h")

    with open(path, "a", encoding="utf-8", newline='\n') as f:
        f.write(f"static const u16 s{sanitized_name}LevelUpLearnset[] = ")
        f.write("{\n")
        f.write("\tLEVEL_UP_MOVE(1, MOVE_TACKLE),\n")
        f.write("\tLEVEL_UP_END\n")
        f.write("};\n\n")

def edit_file_11(data):
    print("Editing src/data/pokemon/tmhm_learnsets.h with", data)
    path = os.path.join("src", "data", "pokemon", "tmhm_learnsets.h")

    with open(path, "r", encoding="utf-8") as f:
        file_content = f.read()

    new_entry = f"\t[{species_number}]    = TMHM_LEARNSET(0),\n"
    updated_content = re.sub(r'\n};', f"\n{new_entry}}};", file_content)

    with open(path, "w", encoding="utf-8", newline='\n') as f:
        f.write(updated_content)

def edit_file_12(data): # TO DO
    print("Editing src/data/pokemon/graphics/back_pic_coordinates.h with", data)

def edit_file_13(data):
    print("Editing src/data/pokemon/graphics/footprint_table.h with", data)
    path = os.path.join("src", "data", "pokemon", "graphics", "footprint_table.h")

    with open(path, "r", encoding="utf-8") as f:
        file_content = f.read()

    new_entry = f"\t[{species_number}]    = gMonFootprint_{sanitized_name},\n"
    updated_content = re.sub(r'\n};', f"\n{new_entry}}};", file_content)

    with open(path, "w", encoding="utf-8", newline='\n') as f:
        f.write(updated_content)

def edit_file_14(data):
    print("Editing src/data/pokemon/graphics/front_pic_coordinates.h with", data)

def edit_file_15(data): # TO DO
    print("Editing src/menu2.c with", data)

    path = os.path.join("src", "menu2.c")

    with open(path, "r", encoding="utf-8") as f:
        file_content = f.read()

    pattern = r'(static const u8 sMonSpriteAnchorCoords\[\]\[5\] = \{\n(?:.*?\n)*?)(\n\};)'
    new_entry = f"\t[{species_number}       - 1] = {{0x20, 0x23, 0x08, 0x20, 0x2d}},\n"

    updated_content = re.sub(pattern, lambda m: m.group(1) + new_entry + m.group(2), file_content, flags=re.DOTALL)

    with open(path, "w", encoding="utf-8", newline="\n") as f:
        f.write(updated_content)

def edit_file_16(data):
    print("Editing src/pokemon_icon.c with", data)
    path = os.path.join("src", "pokemon_icon.c")

    with open(path, "r", encoding="utf-8") as f:
        file_content = f.read()

    pattern = r'(const u8 \*const gMonIconTable\[\] = \{\n(?:.*?\n)*?)(\n\};)'
    new_entry = f"\t[{species_number}]   = gMonIcon_{sanitized_name},\n"

    updated_content = re.sub(pattern, lambda m: m.group(1) + new_entry + m.group(2), file_content, flags=re.DOTALL)

    with open(path, "w", encoding="utf-8", newline="\n") as f:
        f.write(updated_content)

def edit_file_17(data):
    print("Editing src/data/pokemon/graphics/back_pic_table.h with", data)
    path = os.path.join("src", "data", "pokemon", "graphics", "back_pic_table.h")

    with open(path, "r", encoding="utf-8") as f:
        file_content = f.read()

    insert_marker = "SPECIES_SPRITE(EGG, gMonFrontPic_Egg)"
    new_entry = f"\tSPECIES_SPRITE({uppercase_name}, gMonBackPic_{sanitized_name}),\n"

    if insert_marker in file_content:
        updated_content = file_content.replace(insert_marker, new_entry + insert_marker)

        with open(path, "w", encoding="utf-8", newline="\n") as f:
            f.write(updated_content)
    else:
        print("Back Pic Table marker not found, insertion skipped.")

def edit_file_18(data):
    print("Editing src/data/pokemon/graphics/front_pic_table.h with", data)
    path = os.path.join("src", "data", "pokemon", "graphics", "front_pic_table.h")

    with open(path, "r", encoding="utf-8") as f:
        file_content = f.read()

    insert_marker = "SPECIES_SPRITE(EGG, gMonFrontPic_Egg)"
    new_entry = f"\tSPECIES_SPRITE({uppercase_name}, gMonFrontPic_{sanitized_name}),\n"

    if insert_marker in file_content:
        updated_content = file_content.replace(insert_marker, new_entry + insert_marker)

        with open(path, "w", encoding="utf-8", newline="\n") as f:
            f.write(updated_content)
    else:
        print("Front Pic Table marker not found, insertion skipped.")

def edit_file_19(data):
    print("Editing src/data/pokemon/graphics/palette_table.h with", data)
    path = os.path.join("src", "data", "pokemon", "graphics", "palette_table.h")

    with open(path, "r", encoding="utf-8") as f:
        file_content = f.read()

    insert_marker = "SPECIES_PAL(EGG, gMonPalette_Egg)"
    new_entry = f"\tSPECIES_PAL({uppercase_name}, gMonPalette_{sanitized_name}),\n"

    if insert_marker in file_content:
        updated_content = file_content.replace(insert_marker, new_entry + insert_marker)

        with open(path, "w", encoding="utf-8", newline="\n") as f:
            f.write(updated_content)
    else:
        print("Front Pic Table marker not found, insertion skipped.")

def edit_file_20(data):
    print("Editing src/data/pokemon/graphics/shiny_palette_table.h with", data)
    path = os.path.join("src", "data", "pokemon", "graphics", "shiny_palette_table.h")

    with open(path, "r", encoding="utf-8") as f:
        file_content = f.read()

    insert_marker = "SPECIES_SHINY_PAL(EGG, gMonPalette_Egg)"
    new_entry = f"\tSPECIES_SHINY_PAL({uppercase_name}, gMonShinyPalette_{sanitized_name}),\n"

    if insert_marker in file_content:
        updated_content = file_content.replace(insert_marker, new_entry + insert_marker)

        with open(path, "w", encoding="utf-8", newline="\n") as f:
            f.write(updated_content)
    else:
        print("Front Pic Table marker not found, insertion skipped.")

def edit_file_21(data):
    print("Editing src/data/pokemon/species_info.h with", data)
    path = os.path.join("src", "data", "pokemon", "species_info.h")

    with open(path, "r", encoding="utf-8") as f:
        file_content = f.read()

    base_hp = data["HP"]
    base_attack = data["Attack"]
    base_defense = data["Defense"]
    base_speed = data["Speed"]
    base_sp_attack = data["Special Attack"]
    base_sp_defense = data["Special Defense"]
    type1 = data["Type 1"]
    type2 = data["Type 2"]
    body_color = "GRAY"  # <-- You can adapt this to be dynamic if needed

    new_entry = (
        f"    [{species_number}] =\n"
        "    {\n"
        f"        .baseHP = {base_hp},\n"
        f"        .baseAttack = {base_attack},\n"
        f"        .baseDefense = {base_defense},\n"
        f"        .baseSpeed = {base_speed},\n"
        f"        .baseSpAttack = {base_sp_attack},\n"
        f"        .baseSpDefense = {base_sp_defense},\n"
        f"        .types = {{{type1}, {type2}}},\n"
        "        .catchRate = 255,\n"
        "        .expYield = 150,\n"
        "        .evYield_HP = 1,\n"
        "        .evYield_Attack = 1,\n"
        "        .evYield_Defense = 1,\n"
        "        .evYield_Speed = 1,\n"
        "        .evYield_SpAttack = 1,\n"
        "        .evYield_SpDefense = 1,\n"
        "        .itemCommon = ITEM_NONE,\n"
        "        .itemRare = ITEM_NONE,\n"
        "        .genderRatio = PERCENT_FEMALE(50),\n"
        "        .eggCycles = 20,\n"
        "        .friendship = 70,\n"
        "        .growthRate = GROWTH_FAST,\n"
        "        .eggGroups = {EGG_GROUP_MONSTER, EGG_GROUP_GRASS},\n"
        "        .abilities = {ABILITY_EARLY_BIRD, ABILITY_NONE},\n"
        "        .safariZoneFleeRate = 0,\n"
        f"        .bodyColor = BODY_COLOR_{body_color},\n"
        "        .noFlip = FALSE,\n"
        "    },\n"
    )

    updated_content = re.sub(r'(\n\};\s*)$', f"\n{new_entry}\\1", file_content)

    with open(path, "w", encoding="utf-8", newline="\n") as f:
        f.write(updated_content)


def edit_file_22(data):
    print("Editing <UNUSED FILE 22> with", data)

# Create the main window
root = tk.Tk()
root.title("Data Entry GUI")

ttk.Label(root, text="Name:").grid(row=0, column=0)
name_var = tk.StringVar()
ttk.Entry(root, textvariable=name_var).grid(row=0, column=1)

ttk.Label(root, text="Displayed Name:").grid(row=1, column=0)
displayed_name_var = tk.StringVar()
ttk.Entry(root, textvariable=displayed_name_var).grid(row=1, column=1)

ttk.Label(root, text="Type 1:").grid(row=2, column=0)
type1_var = tk.StringVar()
ttk.Entry(root, textvariable=type1_var).grid(row=2, column=1)

ttk.Label(root, text="Type 2:").grid(row=3, column=0)
type2_var = tk.StringVar()
ttk.Entry(root, textvariable=type2_var).grid(row=3, column=1)

ttk.Label(root, text="HP:").grid(row=4, column=0)
hp_var = tk.IntVar()
ttk.Entry(root, textvariable=hp_var).grid(row=4, column=1)

ttk.Label(root, text="Attack:").grid(row=5, column=0)
attack_var = tk.IntVar()
ttk.Entry(root, textvariable=attack_var).grid(row=5, column=1)

ttk.Label(root, text="Defense:").grid(row=6, column=0)
defense_var = tk.IntVar()
ttk.Entry(root, textvariable=defense_var).grid(row=6, column=1)

ttk.Label(root, text="Speed:").grid(row=7, column=0)
speed_var = tk.IntVar()
ttk.Entry(root, textvariable=speed_var).grid(row=7, column=1)

ttk.Label(root, text="Special Attack:").grid(row=8, column=0)
special_attack_var = tk.IntVar()
ttk.Entry(root, textvariable=special_attack_var).grid(row=8, column=1)

ttk.Label(root, text="Special Defense:").grid(row=9, column=0)
special_defense_var = tk.IntVar()
ttk.Entry(root, textvariable=special_defense_var).grid(row=9, column=1)

# Insert Button
ttk.Button(root, text="Insert", command=handle_insert).grid(row=10, column=0, columnspan=2)

# Run the GUI
root.mainloop()