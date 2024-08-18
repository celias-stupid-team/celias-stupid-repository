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

    output_files = {
        "include_constants_species.txt": [],
        "src_data_text_species_names.txt": [],
        "src_data_pokemon_species_info.txt": [],
        "src_data_graphics_pokemon.txt": [],
        "include_graphics_pokemon.txt": [],
        "include_graphics_icons.txt": [],
        "include_constants_hoenn_cries.txt": [],
        "sound_cry_tables.txt": [],
        "sound_cry_tables_reversed.txt": [],
        "sound_direct_sound_data.txt": [],
        "src_data_pokemon_cry_ids.txt": [],
        "src_data_pokemon_level_up_learnset_pointers.txt": [],
        "src_data_pokemon_level_up_learnsets.txt": [],
        "src_data_pokemon_tmhm_learnsets.txt": [],
        "src_data_pokemon_graphics_back_pic_coordinates.txt": [],
        "src_data_pokemon_graphics_footprint_table.txt": [],
        "src_data_pokemon_graphics_front_pic_coordinates.txt": [],
        "src_menu2.txt": [],
        "src_pokemon_icon.txt": [],
        "src_data_pokemon_graphics_back_pic_table.txt": [],
        "src_data_pokemon_graphics_front_pic_table.txt": [],
        "src_data_pokemon_graphics_palette_table.txt": [],
        "src_data_pokemon_graphics_shiny_palette_table.txt": [],
    }

    # Iterate over the rows of the DataFrame
    for index, row in df.iterrows():
        original_name = str(row[column_names[0]])
        display_name = str(row[column_names[1]])
        sanitized_name = sanitize_string(original_name)
        uppercase_name = sanitized_name.upper()
        folder_name = sanitized_name.lower()
        species_number = f"SPECIES_{uppercase_name}"
        truncated_name = display_name[:10].upper()

        # Output 1
        output_files["include_constants_species.txt"].append(f"#define {species_number} {1034 + index}\n")

        # Output 2
        output_files["src_data_text_species_names.txt"].append(f"    [{species_number}] = _(\"{truncated_name}\"),\n")

        # Output 3
        base_hp = row[column_names[2]]
        base_attack = row[column_names[3]]
        base_defense = row[column_names[4]]
        base_speed = row[column_names[5]]
        base_sp_attack = row[column_names[6]]
        base_sp_defense = row[column_names[7]]
        type1 = f"TYPE_{str(row[column_names[8]]).upper()}"
        type2 = f"TYPE_{str(row[column_names[9]]).upper()}" if pd.notna(row[column_names[9]]) else type1
        body_color = str(row[column_names[11]]).upper()

        output_files["src_data_pokemon_species_info.txt"].append(f"[{species_number}] =\n")
        output_files["src_data_pokemon_species_info.txt"].append("{\n")
        output_files["src_data_pokemon_species_info.txt"].append(f"    .baseHP = {base_hp},\n")
        output_files["src_data_pokemon_species_info.txt"].append(f"    .baseAttack = {base_attack},\n")
        output_files["src_data_pokemon_species_info.txt"].append(f"    .baseDefense = {base_defense},\n")
        output_files["src_data_pokemon_species_info.txt"].append(f"    .baseSpeed = {base_speed},\n")
        output_files["src_data_pokemon_species_info.txt"].append(f"    .baseSpAttack = {base_sp_attack},\n")
        output_files["src_data_pokemon_species_info.txt"].append(f"    .baseSpDefense = {base_sp_defense},\n")
        output_files["src_data_pokemon_species_info.txt"].append(f"    .types = {{{type1}, {type2}}},\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .catchRate = 255,\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .expYield = 150,\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .evYield_HP = 1,\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .evYield_Attack = 1,\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .evYield_Defense = 1,\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .evYield_Speed = 1,\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .evYield_SpAttack = 1,\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .evYield_SpDefense = 1,\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .itemCommon = ITEM_NONE,\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .itemRare = ITEM_NONE,\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .genderRatio = PERCENT_FEMALE(50),\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .eggCycles = 20,\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .friendship = 70,\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .growthRate = GROWTH_FAST,\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .eggGroups = {EGG_GROUP_MONSTER, EGG_GROUP_GRASS},\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .abilities = {ABILITY_EARLY_BIRD, ABILITY_NONE},\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .safariZoneFleeRate = 0,\n")
        output_files["src_data_pokemon_species_info.txt"].append(f"    .bodyColor = BODY_COLOR_{body_color},\n")
        output_files["src_data_pokemon_species_info.txt"].append("    .noFlip = FALSE,\n")
        output_files["src_data_pokemon_species_info.txt"].append("},\n")

        # Output 4
        output_files["src_data_graphics_pokemon.txt"].append(f"// {original_name}\n")
        output_files["src_data_graphics_pokemon.txt"].append(f"const u32 gMonFrontPic_{sanitized_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/front.4bpp.lz\");\n")
        output_files["src_data_graphics_pokemon.txt"].append(f"const u32 gMonPalette_{sanitized_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/normal.gbapal.lz\");\n")
        output_files["src_data_graphics_pokemon.txt"].append(f"const u32 gMonBackPic_{sanitized_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/back.4bpp.lz\");\n")
        output_files["src_data_graphics_pokemon.txt"].append(f"const u32 gMonShinyPalette_{sanitized_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/shiny.gbapal.lz\");\n")
        output_files["src_data_graphics_pokemon.txt"].append(f"const u8 gMonIcon_{sanitized_name}[] = INCBIN_U8(\"graphics/pokemon/{folder_name}/icon.4bpp\");\n")
        output_files["src_data_graphics_pokemon.txt"].append(f"const u8 gMonFootprint_{sanitized_name}[] = INCBIN_U8(\"graphics/pokemon/{folder_name}/footprint.1bpp\");\n")
        output_files["src_data_graphics_pokemon.txt"].append("\n")

        # Output 5
        output_files["include_graphics_pokemon.txt"].append(f"// {original_name}\n")
        output_files["include_graphics_pokemon.txt"].append(f"extern const u32 gMonFrontPic_{sanitized_name}[];\n")
        output_files["include_graphics_pokemon.txt"].append(f"extern const u32 gMonPalette_{sanitized_name}[];\n")
        output_files["include_graphics_pokemon.txt"].append(f"extern const u32 gMonBackPic_{sanitized_name}[];\n")
        output_files["include_graphics_pokemon.txt"].append(f"extern const u32 gMonShinyPalette_{sanitized_name}[];\n")
        output_files["include_graphics_pokemon.txt"].append(f"extern const u8 gMonIcon_{sanitized_name}[];\n")
        output_files["include_graphics_pokemon.txt"].append(f"extern const u8 gMonFootprint_{sanitized_name}[];\n")
        output_files["include_graphics_pokemon.txt"].append("\n")

        # Output 6
        output_files["include_graphics_icons.txt"].append(f"extern const u8 gMonIcon_{sanitized_name}[];\n")

        # Output 7
        output_files["include_constants_hoenn_cries.txt"].append(f"\tCRY_{uppercase_name} = {1034 + index},\n")

        # Output 8
        output_files["sound_cry_tables.txt"].append(f"\tcry Cry_{sanitized_name}\n")

        # Output 9
        output_files["sound_cry_tables_reversed.txt"].append(f"\tcry_reverse Cry_{sanitized_name}\n")

        # Output 10
        output_files["sound_direct_sound_data.txt"].append(f"Cry_{sanitized_name}::\n")
        output_files["sound_direct_sound_data.txt"].append(f"\t.incbin \"sound/direct_sound_samples/cries/{folder_name}.bin\"\n\n")
        output_files["sound_direct_sound_data.txt"].append(f"\t.align 2\n")

        # Output 11
        output_files["src_data_pokemon_cry_ids.txt"].append(f"\t[{species_number} - HOENN_MON_SPECIES_START] = CRY_{uppercase_name},\n")

        # Output 12
        output_files["src_data_pokemon_level_up_learnset_pointers.txt"].append(f"\t[{species_number}] = s{sanitized_name}LevelUpLearnset,\n")

        # Output 13
        output_files["src_data_pokemon_level_up_learnsets.txt"].append(f"static const u16 s{sanitized_name}LevelUpLearnset[] = ")
        output_files["src_data_pokemon_level_up_learnsets.txt"].append("{\n") #f doesn't like curly braces :(
        output_files["src_data_pokemon_level_up_learnsets.txt"].append("\tLEVEL_UP_MOVE(1, MOVE_TACKLE),\n")
        output_files["src_data_pokemon_level_up_learnsets.txt"].append("\tLEVEL_UP_END\n")
        output_files["src_data_pokemon_level_up_learnsets.txt"].append("};\n\n")


        # Output 14
        
        output_files["src_data_pokemon_tmhm_learnsets.txt"].append(f"\t[{species_number}]    = TMHM_LEARNSET(0),\n")

        # Output 15
        output_files["src_data_pokemon_graphics_back_pic_coordinates.txt"].append(f"\t[{species_number}] =\n")
        output_files["src_data_pokemon_graphics_back_pic_coordinates.txt"].append("\t{\n")
        output_files["src_data_pokemon_graphics_back_pic_coordinates.txt"].append("\t\t.size = MON_COORDS_SIZE(48, 32),\n")
        output_files["src_data_pokemon_graphics_back_pic_coordinates.txt"].append("\t\t.y_offset = 16,\n")
        output_files["src_data_pokemon_graphics_back_pic_coordinates.txt"].append("\t},\n") 

        # Output 16
        output_files["src_data_pokemon_graphics_footprint_table.txt"].append(f"\t[{species_number}]    = gMonFootprint_{sanitized_name},\n")

        # Output 17
        
        output_files["src_data_pokemon_graphics_front_pic_coordinates.txt"].append(f"\t[{species_number}] =\n")
        output_files["src_data_pokemon_graphics_front_pic_coordinates.txt"].append("\t{\n")
        output_files["src_data_pokemon_graphics_front_pic_coordinates.txt"].append("\t\t.size = MON_COORDS_SIZE(48, 32),\n")
        output_files["src_data_pokemon_graphics_front_pic_coordinates.txt"].append("\t\t.y_offset = 16,\n")
        output_files["src_data_pokemon_graphics_front_pic_coordinates.txt"].append("\t},\n")    

        # Output 18
        output_files["src_menu2.txt"].append(f"\t[{species_number}       - 1] = ")
        output_files["src_menu2.txt"].append("{0x20, 0x23, 0x08, 0x20, 0x2d},\n")
        

        # Output 19
        output_files["src_pokemon_icon.txt"].append(f"\t[{species_number}]   = gMonIcon_{sanitized_name},\n")

        # Output 20
        output_files["src_data_pokemon_graphics_back_pic_table.txt"].append(f"\tSPECIES_SPRITE({uppercase_name}, gMonBackPic_{sanitized_name}),\n")

        # Output 21
        output_files["src_data_pokemon_graphics_front_pic_table.txt"].append(f"\tSPECIES_SPRITE({uppercase_name}, gMonFrontPic_{sanitized_name}),\n")

        # Output 22
        output_files["src_data_pokemon_graphics_palette_table.txt"].append(f"\tSPECIES_PAL({uppercase_name}, gMonPalette_{sanitized_name}),\n")

        # Output 23
        output_files["src_data_pokemon_graphics_shiny_palette_table.txt"].append(f"\tSPECIES_SHINY_PAL({uppercase_name}, gMonShinyPalette_{sanitized_name}),\n")

    # Write the outputs to their respective files
    for filename, content in output_files.items():
        with open(filename, "w") as f:
            f.writelines(content)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python excel_to_outputs.py <input_excel_file>")
    else:
        excel_to_outputs(sys.argv[1])
