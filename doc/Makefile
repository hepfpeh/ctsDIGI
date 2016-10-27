# Makefile para la compilación de main.tex

TEXFILE = docmain
BIBFILE = bibliografia
TEX = pdflatex -interaction=nonstopmode -file-line-error
BIB = biber

.PHONY: all clean

all:
	$(TEX) $(TEXFILE).tex
	$(TEX) $(TEXFILE).tex
	cp $(TEXFILE).pdf ../guide.pdf

clean:
	@if [ -f $(TEXFILE).aux ]; then rm $(TEXFILE).aux; fi;
	@if [ -f $(TEXFILE).log ]; then rm $(TEXFILE).log; fi;
	@if [ -f $(TEXFILE).bcf ]; then rm $(TEXFILE).bcf; fi;
	@if [ -f $(TEXFILE).blg ]; then rm $(TEXFILE).blg; fi;
	@if [ -f $(TEXFILE).bbl ]; then rm $(TEXFILE).bbl; fi;
	@if [ -f $(TEXFILE).run.xml ]; then rm $(TEXFILE).run.xml; fi;
	@if [ -f $(TEXFILE).ttt ]; then rm $(TEXFILE).ttt; fi;
	@if [ -f $(TEXFILE).fff ]; then rm $(TEXFILE).fff; fi;
	@if [ -f $(TEXFILE).synctex.gz ]; then rm $(TEXFILE).synctex.gz; fi;
	@if [ -f $(TEXFILE).out ]; then rm $(TEXFILE).out; fi;
	@if [ -f $(TEXFILE).pdf ]; then rm $(TEXFILE).pdf; fi;
