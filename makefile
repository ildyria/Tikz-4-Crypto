LATEXMK = latexmk -pdf
LATEX = pdflatex
READ = evince
SOURCES := $(wildcard *.tex)
SOURCES := $(filter-out pgflibraryarrows.new.code.tex, $(SOURCES))
SOURCES := $(filter-out tikzlibrarykeccaktree.code.tex,  $(SOURCES))
SOURCES := $(filter-out tikzlibrarycrypto.symbols.code.tex,  $(SOURCES))
OBJECTS := $(notdir $(SOURCES:.tex=.pdf))


all: $(OBJECTS)

cleanpdf:
	@rm *.pdf 2> /dev/null || true

force: cleanpdf $(OBJECTS)

%.pdf: %.tex
	echo $*.tex
	$(LATEX) $*.tex

open:
	${READ} $(OBJECTS)


clean:
	@echo cleaning...
	@rm *.aux 2> /dev/null || true
	@rm *.log 2> /dev/null || true
	@rm *.out 2> /dev/null || true
	@rm *.toc 2> /dev/null || true
	@rm *.snm 2> /dev/null || true
	@rm *.nav 2> /dev/null || true
	@rm *.vrb 2> /dev/null || true
	@rm *.bbl 2> /dev/null || true
	@rm *.blg 2> /dev/null || true
	@rm *.idx 2> /dev/null || true
	@rm *.lol 2> /dev/null || true
	@rm *.fls 2> /dev/null || true
	@rm *.fdb_latexmk 2> /dev/null || true
