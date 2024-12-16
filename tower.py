from PIL import Image
import numpy as np
import os

def get_tile_variants(tile):
    """Generate all unique variants of a tile: original, flipped horizontally, and flipped vertically."""
    tile_array = np.array(tile)
    variants = [
        tile_array,
        np.fliplr(tile_array),  # Flip horizontally
        np.flipud(tile_array)   # Flip vertically
    ]
    # Create hashes for each variant
    return [hash(variant.tobytes()) for variant in variants]

def split_image_into_tiles(image_path, tile_size=8):
    image = Image.open(image_path)
    width, height = image.size
    tiles = {}

    for y in range(0, height, tile_size):
        for x in range(0, width, tile_size):
            box = (x, y, x + tile_size, y + tile_size)
            tile = image.crop(box)
            
            tile_hashes = get_tile_variants(tile)
            if not any(tile_hash in tiles for tile_hash in tile_hashes):
                tiles[tile_hashes[0]] = tile

    return tiles

def save_tiles(tiles, output_folder):
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    for i, (tile_hash, tile) in enumerate(tiles.items()):
        tile.save(rf"{output_folder}/tile_{i}.png")

def main(image_path, output_folder):
    tiles = split_image_into_tiles(image_path)
    save_tiles(tiles, output_folder)
    print(f"Saved {len(tiles)} unique tiles to {output_folder}")

if __name__ == "__main__":
    image_path = r"C:\Users\Celia Dawn\Desktop\lavendertower.png"
    output_folder = r"C:\Users\Celia Dawn\Desktop\output"
    main(image_path, output_folder)
