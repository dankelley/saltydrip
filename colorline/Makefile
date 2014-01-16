all: knit.out colorline.out
%.out:%.R
	R --no-save < $< > $@
clean:
	rm -f *~ *.out *.png figures/*png


