all: knit.out # butter.out
%.out:%.R
	R --no-save < $< > $@
clean:
	rm -f *~ *.out *.png


