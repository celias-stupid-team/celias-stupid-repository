import os
from PIL import Image

# Path to the base directory
base_dir = r"C:\Users\Celia Dawn\Documents\Roms\Decomps\celias-stupid-repository\graphics\pokemon"

# Walk through the directory
for root, dirs, files in os.walk(base_dir):
    for file in files:
        if file == "anim_front.png":
            # Full path to the image file
            file_path = os.path.join(root, file)
            # Open the image
            with Image.open(file_path) as img:
                # Check if the image is 16-color indexed PNG and has the expected dimensions
                if img.mode == 'P' and img.width == 64 and img.height == 128:
                    # Crop the image to keep only the top half
                    cropped_img = img.crop((0, 0, 64, 64))
                    # Save the cropped image as front.png in the same directory
                    cropped_img.save(os.path.join(root, "front.png"), format="PNG")

print("Processing complete.")
