Celadon Map: This one will go in graphics\region_map
Tilemap:  sevii_123.bin
Tilset: celadon_tiles.png
Palette: celadon_map.pal

This image was exported from HMA, which automatically set all 8x8 tiles to use one palette each, though I don't know if I can automatically pull up which one for each. I straight up do not know if it's possible to maintain the correct indexing after putting it through Tilemap Studio, which would otherwise ruin it by collapsing similar colors together.

16 Color Celadon map is a variant on the raw map in which every tile is set to have the colors of the first 16 colors in the palette. This is so you can import it into tilemap studio and import the 16-color palette into the image while still maintaining each tile's relative mapping - In an ideal world, this would mean we can just draw on their "actual" palette slots using TMS and have everything render properly, but we all know that's unlikely.


- - - - - - - - - - - - - -