import pandas as pd
import re
import sys

def sanitize_string(s):
    """Replace all spaces and non-alphanumeric characters with an underscore."""
    return re.sub(r'[^a-zA-Z0-9]', '_', s)

def excel_to_src_data_graphics_pokemon(input_file, output_file):
    # Read the Excel file
    df = pd.read_excel(input_file)

    # Specify the columns to use
    column_names = df.columns

    with open(output_file, 'w') as file:
        # Iterate over the rows of the DataFrame
        for index, row in df.iterrows():
            original_name = str(row[column_names[0]])
            sanitized_name = sanitize_string(original_name).upper()
            folder_name = original_name.lower()

            # Write the formatted string to the file
            file.write(f"// {original_name}\n")
            file.write(f"const u32 gMonFrontPic_{original_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/front.4bpp.lz\");\n")
            file.write(f"const u32 gMonPalette_{original_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/normal.gbapal.lz\");\n")
            file.write(f"const u32 gMonBackPic_{original_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/back.4bpp.lz\");\n")
            file.write(f"const u32 gMonShinyPalette_{original_name}[] = INCBIN_U32(\"graphics/pokemon/{folder_name}/shiny.gbapal.lz\");\n")
            file.write(f"const u8 gMonIcon_{original_name}[] = INCBIN_U8(\"graphics/pokemon/{folder_name}/icon.4bpp\");\n")
            file.write(f"const u8 gMonFootprint_{original_name}[] = INCBIN_U8(\"graphics/pokemon/{folder_name}/footprint.1bpp\");\n")
            file.write("\n")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python excel_to_src_data_graphics_pokemon.py <input_file> <output_file>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    excel_to_src_data_graphics_pokemon(input_file, output_file)
