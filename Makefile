# FIXME: put all in subdirs; add targets to create (and do in crontab)
#all: daylength.out coastline.out coastline2.out worldmap.out coastline_new.out analemma.out sundial_with_gnomon.out
DIRS = butter colorline
subdirs:
	for dir in $(DIRS); do \
	    $(MAKE) -C $$dir; \
	done
clean:
	for dir in $(DIRS); do \
	    $(MAKE) clean -C $$dir; \
	done
