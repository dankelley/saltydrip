all: knit.out
%.out:%.R
	R --no-save < $< > $@
clean:
	rm -f *~ *.out *.png figure/*png


