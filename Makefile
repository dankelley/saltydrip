all: daylength.out coastline.out coastline2.out worldmap.out coastline_new.out analemma.out sundial_with_gnomon.out
%.out:%.R
	R --no-save < $< > $@

