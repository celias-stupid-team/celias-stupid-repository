import os
import aifc
import stat
from pydub import AudioSegment

def check_and_convert_aif_files(directory):
    # List all .aif files in the directory
    aif_files = [f for f in os.listdir(directory) if f.endswith('.aif')]
    
    for file in aif_files:
        file_path = os.path.join(directory, file)
        
        # Read the AIFF file
        with aifc.open(file_path, 'r') as aif:
            sample_size = aif.getsampwidth() * 8  # sample size in bits
            form_type = aif.getcomptype()
            print(f"{file}: sample size is {sample_size} bits, form type is {form_type}")
            
            # If sample size is not 8 or form type is not AIFF, convert the file
            if sample_size != 8 or form_type != b'NONE':
                print(f"Converting {file} to 8-bit sample size and AIFF format.")
                convert_to_aiff_8bit(file_path)

def convert_to_aiff_8bit(file_path):
    # Ensure the file is closed before processing
    try:
        audio = AudioSegment.from_file(file_path, format="aiff")
    except Exception as e:
        print(f"Error reading file {file_path}: {e}")
        return

    # Convert the file to AIFF format with 8-bit sample size using pydub
    audio = audio.set_sample_width(1)  # set sample width to 1 byte (8 bits)
    new_file_path = file_path.replace('.aif', '_converted.aiff')
    audio.export(new_file_path, format="aiff")

    # Ensure the new file has the correct permissions
    os.chmod(new_file_path, stat.S_IRWXU)

    # Replace the original file with the converted one
    try:
        os.replace(new_file_path, file_path)
        print(f"Converted and overwritten file: {file_path}")
    except PermissionError as e:
        print(f"PermissionError: {e}")
        try:
            os.remove(file_path)  # Attempt to delete the original file
            os.rename(new_file_path, file_path)
            print(f"Replaced original file with {new_file_path}")
        except Exception as e:
            print(f"Failed to replace file: {e}")

def delete_bin_files(directory):
    # List all .bin files in the directory
    bin_files = [f for f in os.listdir(directory) if f.endswith('.bin')]
    
    for file in bin_files:
        file_path = os.path.join(directory, file)
        os.remove(file_path)
        print(f"Deleted file: {file_path}")

# Directory containing the .aif files and .bin files to delete
directory = 'sound/direct_sound_samples/cries'

# Check and convert .aif files in the directory
check_and_convert_aif_files(directory)

# Delete .bin files in the directory
delete_bin_files(directory)
