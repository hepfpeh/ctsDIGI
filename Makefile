# Makefile para la compilación de main.tex

TEXFILE = main
BIBFILE = bibliografia
TEX = pdflatex -interaction=nonstopmode -file-line-error
BIB = biber

.PHONY: all post comp

all: post

post: $(TEXFILE).aux $(TEXFILE).bbl
	$(TEX) $(TEXFILE).tex
	$(TEX) $(TEXFILE).tex

$(TEXFILE).bbl: $(TEXFILE).bcf $(BIBFILE).bib
	$(BIB) $(TEXFILE).bcf

$(TEXFILE).bcf: comp

$(TEXFILE).aux: comp

comp: $(TEXFILE).tex
	$(TEX) $(TEXFILE).tex

clean:
	@if [ -f $(TEXFILE).aux ]; then rm $(TEXFILE).aux; fi;
	@if [ -f $(TEXFILE).log ]; then rm $(TEXFILE).log; fi;
	@if [ -f $(TEXFILE).bcf ]; then rm $(TEXFILE).bcf; fi;
	@if [ -f $(TEXFILE).blg ]; then rm $(TEXFILE).blg; fi;
	@if [ -f $(TEXFILE).bbl ]; then rm $(TEXFILE).bbl; fi;
	@if [ -f $(TEXFILE).run.xml ]; then rm $(TEXFILE).run.xml; fi;
	@if [ -f $(TEXFILE).ttt ]; then rm $(TEXFILE).ttt; fi;
	@if [ -f $(TEXFILE).fff ]; then rm $(TEXFILE).fff; fi;
