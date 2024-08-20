import aifc

def analyze_aif_file(file_path):
    try:
        with aifc.open(file_path, 'r') as aif_file:
            params = aif_file.getparams()
            print(f"File: {file_path}")
            print(f"Number of channels: {params.nchannels}")
            print(f"Sample width (bytes): {params.sampwidth}")
            print(f"Frame rate (samples per second): {params.framerate}")
            print(f"Number of frames: {params.nframes}")
            print(f"Compression type: {params.comptype}")
            print(f"Compression name: {params.compname}")
    except Exception as e:
        print(f"Error reading {file_path}: {e}")

# Paths to your AIFF files
seviper_good_path = 'Seviper_GOOD.aif'
seviper_bad_path = 'Seviper_BAD.aif'

# Analyze the good file
analyze_aif_file(seviper_good_path)

# Analyze the bad file
analyze_aif_file(seviper_bad_path)
