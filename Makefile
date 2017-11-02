SOURCES = $(wildcard *.tex)
TARGETS = $(patsubst %.tex, %, $(SOURCES))

all: pdf

pdf:
	pdflatex $(TARGETS)
	@if ( grep "\\\\bibliography{" $(TARGETS).tex > /dev/null ); then \
		bibtex $(TARGETS); \
		pdflatex $(TARGETS); \
	fi
	pdflatex $(TARGETS)
	pdflatex $(TARGETS)

open: pdf
	open $(TARGETS).pdf

mostlyclean:
	rm -f *.aux *.log *.bbl *.blg *.toc *.out a0header.ps

clean: mostlyclean
	rm -f *.pdf

.PHONY: all
