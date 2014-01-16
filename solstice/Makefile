all: knit.out
%.out: %.R
	R --no-save < $< > $@
clean:
	rm *~ *.md *.out *.png

