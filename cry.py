import os
import stat
from pydub import AudioSegment

def convert_wav_to_aiff(directory):
    # List all .wav files in the directory
    wav_files = [f for f in os.listdir(directory) if f.endswith('.wav')]
    
    for file in wav_files:
        file_path = os.path.join(directory, file)
        
        print(f"Converting {file} to AIFF format with 8-bit sample size.")
        convert_to_aiff_8bit(file_path)

def convert_to_aiff_8bit(file_path):
    # Read the WAV file
    try:
        audio = AudioSegment.from_file(file_path, format="wav")
    except Exception as e:
        print(f"Error reading file {file_path}: {e}")
        return
    
    # Convert the file to AIFF format with 8-bit sample size using pydub
    audio = audio.set_sample_width(1)  # set sample width to 1 byte (8 bits)
    new_file_path = file_path.replace('.wav', '.aif')
    audio.export(new_file_path, format="aiff")
    
    # Ensure the new file has the correct permissions
    os.chmod(new_file_path, stat.S_IRWXU)

    print(f"Converted file saved as: {new_file_path}")

def delete_bin_files(directory):
    # List all .bin files in the directory
    bin_files = [f for f in os.listdir(directory) if f.endswith('.bin')]
    
    for file in bin_files:
        file_path = os.path.join(directory, file)
        os.remove(file_path)
        print(f"Deleted file: {file_path}")

# Directory containing the .wav files to convert and .bin files to delete
directory = 'cries'

# Convert .wav files in the directory to .aif files
convert_wav_to_aiff(directory)

# Delete .bin files in the directory
delete_bin_files(directory)
