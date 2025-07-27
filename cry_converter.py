import os
from pydub import AudioSegment

def convert_audio_to_aifc(input_folder):
    """
    Scans a folder for .mp3, .wav, .aif, and .aiff files,
    converts them to the AIFF format with PCM signed 8-bit (pcm_s8) codec,
    and overwrites the original files.
    """
    # Supported input file extensions
    supported_formats = ('.mp3', '.wav', '.aif', '.aiff')

    for filename in os.listdir(input_folder):
        # Check if the file is one of the supported formats
        if filename.endswith(supported_formats):
            input_path = os.path.join(input_folder, filename)
            output_path = os.path.join(input_folder, os.path.splitext(filename)[0] + '.aif')
            
            try:
                # Load the audio file
                audio = AudioSegment.from_file(input_path)
                
                # Ensure proper format: 10,512 Hz, mono, 8-bit PCM
                formatted_audio = (audio
                                   .set_frame_rate(10512)
                                   .set_channels(1)
                                   .set_sample_width(1))  # 8-bit PCM

                # Export the file in AIFF format with pcm_s8 codec
                formatted_audio.export(output_path, format="aiff", codec="pcm_s8")
                
                # If the input and output paths differ, remove the original file
                if input_path != output_path:
                    os.remove(input_path)
                
                print(f"Converted: {filename} -> {os.path.basename(output_path)}")
            except Exception as e:
                print(f"Error converting {filename}: {e}")

def main():
    # Argument parsing
    import argparse
    parser = argparse.ArgumentParser(description="Convert audio files in a folder to AIFF format (pcm_s8).")
    parser.add_argument("input_folder", help="Path to the folder containing audio files.")
    
    args = parser.parse_args()
    
    # Convert the audio files
    convert_audio_to_aifc(args.input_folder)

if __name__ == "__main__":
    main()

# Usage: python cry_converter.py sound