all: knit.out #cabelling.out
%.out: %.R
	R --no-save < $< > $@
clean:
	rm *~ *.out *.png

