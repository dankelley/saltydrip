all: editing_vim.md knit.out
%.md: %.Rmd
	R --no-save < knit.R > knit.out
clean:
	rm -f *~ *.out


