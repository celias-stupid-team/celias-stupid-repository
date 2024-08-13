import pandas as pd
import re
import sys

def sanitize_string(s):
    """Replace all spaces and non-alphanumeric characters with an underscore."""
    return re.sub(r'[^a-zA-Z0-9]', '_', s)

def excel_to_outputs(input_file):
    # Read the Excel file
    df = pd.read_excel(input_file)

    # Specify the columns to use
    column_names = df.columns

    output_file1 = "include_constants_species.txt"
    output_file2 = "src_data_text_species_names.txt"
    output_file3 = "src_data_pokemon_species_info.txt"
    output_file4 = "src_data_graphics_pokemon.txt"

    with open(output_file1, 'w') as file1, open(output_file2, 'w') as file2, open(output_file3, 'w') as file3, open(output_file4, 'w') as file4:
        # Iterate over the rows of the DataFrame
        for index, row in df.iterrows():
            original_name = str(row[column_names[0]])
            sanitized_name = sanitize_string(original_name).upper()
            folder_name = original_name.lower()
            species_number = f"SPECIES_{sanitized_name}"
            truncated_name = original_name[:10].upper()

            # Output 1
            file1.write(f"#define {species_number} {412 + index}\n")

            # Output 2
            file2.write(f"    [{species_number}] = _(\"{truncated_name}\"),\n")

            # Output 3
            base_hp = row[column_names[1]]
            base_attack = row[column_names[2]]
            base_defense = row[column_names[3]]
            base_speed = row[column_names[4]]
            base_sp_attack = row[column_names[5]]
            base_sp_defense = row[column_names[6]]
            type1 = row[column_names[7]]
            type2 = row[column_names[8]] if pd.notna(row[column_names[8]]) else type1
            body_color = str(row[column_names[10]]).upper()

            file3.write(f"[{species_number}] =\n")
            file3.write("{\n")
            file3.write(f"    .baseHP = {base_hp},\n")
            file3.write(f"    .baseAttack = {base_attack},\n")
            file3.write(f"    .baseDefense = {base_defense},\n")
            file3.write(f"    .baseSpeed = {base_speed},\n")
            file3.write(f"    .baseSpAttack = {base_sp_attack},\n")
            file3.write(f"    .baseSpDefense = {base_sp_defense},\n")
            file3.write(f"    .types = {{{type1}, {type2}}},\n")
            file3.write("    .catchRate = 255,\n")
            file3.write("    .expYield = 150,\n")
            file3.write("    .evYield_HP = 1,\n")
            file3.write("    .evYield_Attack = 1,\n")
            file3.write("    .evYield_Defense = 1,\n")
            file3.write("    .evYield_Speed = 1,\n")
            file3.write("    .evYield_SpAttack = 1,\n")
            file3.write("    .evYield_SpDefense = 1,\n")
            file3.write("    .itemCommon = ITEM_NONE,\n")
            file3.write("    .itemRare = ITEM_NONE,\n")
            file3.write("    .genderRatio = PERCENT_FEMALE(50),\n")
            file3.write("    .eggCycles = 20,\n")
            file3.write("    .friendship = 70,\n")
            file3.write("    .growthRate = GROWTH_FAST,\n")
            file3.write("    .eggGroups = {EGG_GROUP_MONSTER, EGG_GROUP_GRASS},\n")
            file3.write("    .abilities = {ABILITY_EARLY_BIRD, ABILITY_NONE},\n")
            file3.write("    .safariZoneFleeRate = 0,\n")
            file3.write(f"    .bodyColor = BODY_COLOR_{body_color},\n")
            file3.write("    .noFlip = FALSE,\n")
            file3.write("},\n")

            # Output 4
            file4.write(f"// {original_name}\n")
            file4.write(f"const u32 gMonFrontPic_{original_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/front.4bpp.lz\");\n")
            file4.write(f"const u32 gMonPalette_{original_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/normal.gbapal.lz\");\n")
            file4.write(f"const u32 gMonBackPic_{original_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/back.4bpp.lz\");\n")
            file4.write(f"const u32 gMonShinyPalette_{original_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/shiny.gbapal.lz\");\n")
            file4.write(f"const u8 gMonIcon_{original_name}[] = INCBIN_U8(\"graphics/pokemon/{folder_name}/icon.4bpp\");\n")
            file4.write(f"const u8 gMonFootprint_{original_name}[] = INCBIN_U8(\"graphics/pokemon/{folder_name}/footprint.1bpp\");\n")
            file4.write("\n")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python excel_to_outputs.py <input_file>")
        sys.exit(1)

    input_file = sys.argv[1]

    excel_to_outputs(input_file)
