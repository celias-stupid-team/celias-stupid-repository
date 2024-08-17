import os
import wave
import aifc
from pydub import AudioSegment

def convert_wav_to_aiff(directory):
    # List all .wav files in the directory
    wav_files = [f for f in os.listdir(directory) if f.endswith('.wav')]
    
    for file in wav_files:
        file_path = os.path.join(directory, file)
        
        print(f"Converting {file} to AIFF format with 8-bit sample size.")
        temp_aifc_path = file_path.replace('.wav', '_temp.aif')
        final_aif_path = file_path.replace('.wav', '.aif')
        
        # Step 1: Convert WAV to AIFC format first (temporary)
        audio = AudioSegment.from_file(file_path, format="wav")
        audio.export(temp_aifc_path, format="aiff")
        
        # Step 2: Re-process the temporary AIFC file to AIFF and set 8-bit sample size
        rewrite_aiff_with_8bit(temp_aifc_path, final_aif_path)
        
        # Remove the temporary file
        os.remove(temp_aifc_path)

def rewrite_aiff_with_8bit(temp_aifc_path, final_aif_path):
    with aifc.open(temp_aifc_path, 'r') as aifc_file:
        params = aifc_file.getparams()
        frames = aifc_file.readframes(params.nframes)

    with wave.open(final_aif_path, 'w') as aiff_file:
        aiff_file.setnchannels(params.nchannels)
        aiff_file.setsampwidth(1)  # Set sample width to 1 byte (8 bits)
        aiff_file.setframerate(params.framerate)
        aiff_file.writeframes(frames)
    
    print(f"Corrected and saved AIFF file with 8-bit sample size: {final_aif_path}")

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
