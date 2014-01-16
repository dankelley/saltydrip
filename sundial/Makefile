all: sundial.out
%.out:%.R
	R --no-save < $< > $@
clean:
	rm -rf *~ *.out *.png

