# Dicussion of possible change to oce coastline files

The files are "Existing" (what is in oce as of early December 2013), "Fine"
(the 1:10m file from http://www.naturalearthdata.com/download/10m/cultural),
"Medium" (the 1:50m file) and "Coarse" (the 1:100m file).  The latter three
were downladed 2013 Dec and read into Oce with names ``coastlineWorldFine``
etc.

## Timing tests (globe-scale)

Table below shows user time in seconds to plot a world map (), and coastline name.

     6.19   Existing
    17.14   Fine
     0.66   Medium
     0.14   Coarse

## Sizes of .rda files

    1.8M  Existing
    3.0M  Fine
    0.5M  Medium
    0.1M  Coarse

## Globe-scale plot quality (worldmap.R)

1. The Coarse file leaves out a visible number of islands, so despite its speed
and small file size, it is problematic.  (This is consistent with the advice to
use this only for postcard sized world images.)

2. Medium and Existing look the same, so Medium is preferable on the world
scale because of the 10X speed improvement.

## Shelf-scale plot quality (shelf.R)

1. Coarse is entirely unacceptable.

2. Medium (blue curve) is visibly worse than Existing, so swapping Medium for
Existing without adding Fine would not be sensible.

## Conclusion

1. Switch Medium for Existing, which will lower file size by 1.3Mb and increase
plot speed by 10X.

2. Add Fine, for local scales, at a cost of 3.0Mb, less the 1.3Mb from
switching to Medium, for a net increase of 1.7Mb.

3. Possibly add Coarse, which gives great speed increases and small PDF files;
it should perhaps be limited for inset diagrams, but the cost in storage is so
low that not including it seems unsensible.

