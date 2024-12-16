from PIL import Image, ImageDraw
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

def identify_unique_tiles(image_path, tile_size=8):
    image = Image.open(image_path)
    width, height = image.size
    tiles = {}
    positions = {}

    for y in range(0, height, tile_size):
        for x in range(0, width, tile_size):
            box = (x, y, x + tile_size, y + tile_size)
            tile = image.crop(box)
            
            tile_hashes = get_tile_variants(tile)
            if not any(tile_hash in tiles for tile_hash in tile_hashes):
                tiles[tile_hashes[0]] = tile
                positions[(x, y)] = tile_hashes[0]

    return tiles, positions, width, height

def create_image_with_unique_tiles(image_path, tiles, positions, width, height, tile_size=8):
    image = Image.open(image_path)
    new_image = Image.new("RGBA", (width, height), (0, 0, 0, 0))  # Create a transparent image

    for (x, y), tile_hash in positions.items():
        tile = tiles[tile_hash]
        new_image.paste(tile, (x, y))

    return new_image

def main(image_path, output_path):
    tiles, positions, width, height = identify_unique_tiles(image_path)
    new_image = create_image_with_unique_tiles(image_path, tiles, positions, width, height)
    new_image.save(output_path)
    print(f"Processed image saved to {output_path}")

if __name__ == "__main__":
    image_path = r"C:\Users\Celia Dawn\Documents\Roms\Decomps\celias-stupid-repository\your_image.png"
    output_path = r"C:\Users\Celia Dawn\Desktop\output\processed_image.png"
    main(image_path, output_path)
