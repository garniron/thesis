TEX=thesis

# compilateur latex
CC=pdflatex
#CC=latex -synctex=1

$(TEX).pdf: $(wildcard *.tex) $(TEX).bib
#	- $(MAKE) -C Figs
	- latexmk -pdf -bibtex $(TEX).tex || make all 
#	- dvipdf $(TEX)
#	- latexmk -pdf || make all

all: $(TEX).tex
	- $(CC) $(TEX)
	- $(CC) $(TEX)
	- @bibtex $(TEX)
	- $(CC) $(TEX)
	- $(CC) $(TEX)

.PHONY: clean
clean:
	@latexmk -c
	@rm -vf $(TEX).pdf $(TEX).dvi
	@echo "done"

follow:
	latexmk -pdf -view=pdf -bibtex -pvc -gg -interaction=nonstopmode $(TEX)
