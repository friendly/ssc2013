# A Makefile to easily handle the compilation of
# presentations, made using the LaTeX class Beamer
#
# Patrick Pletscher
# 2006-03-05
#
# NOTE: We assume that you have a directory structure similar to
# the following:
# 
#  slides/
#    src/
#    slides.pdf
#    notes.pdf
#    handout.pdf
#
# So we copy the resulting pdf's to the parent directory.

#  latex or  pdflatex?
LATEX = pdflatex

# LaTeX flags
LATEXFLAGS = -interaction=nonstopmode

# LaTeX sourcecode of slides
#SRC = carme
#SRC = datavis
SRC = ssc2013
INCLUDES = frames/*

# how the resulting files should be named
SLIDES_SRC = $(SRC)-slides
HANDOUT_SRC = $(SRC)-handout
NOTES_SRC = $(SRC)-notes

PDFNUP = pdfnup
NUP = --nup 2x2 --landscape --suffix '2x2'
NUP12 = --nup 1x2 --no-landscape --suffix '1x2'
NUP23 = --nup 2x3 --orient portrait 
NUP33 = --nup 3x3 --landscape 
NUP44 = --nup 4x4 --landscape 
NUPOPTS = --paper letterpaper --frame true --delta "2mm 2mm"

# normally we just want to create the slides
short:		$(SRC).tex $(INCLUDES)
		$(LATEX) $(LATEXFLAGS) $(SRC).tex
#		dvipdf $(SRC)

# create slides and handouts
final:		slides handout

# create the normal slides for the presentation
slides:		$(SRC).tex
		cp $(SRC).tex $(SLIDES_SRC).tex
		$(LATEX) $(LATEXFLAGS) $(SLIDES_SRC)
		$(LATEX) $(LATEXFLAGS) $(SLIDES_SRC)
#		dvipdf $(SLIDES_SRC) 
		rm -f $(SLIDES_SRC).tex
		
# create notes
notes:		$(SRC).tex
		echo '\PassOptionsToClass{notes=only}{beamer}\input{$(SRC).tex}' > $(NOTES_SRC).tex
		$(LATEX) $(LATEXFLAGS) $(NOTES_SRC).tex
		$(LATEX) $(LATEXFLAGS) $(NOTES_SRC).tex
#		dvipdf $(NOTES_SRC) 
		$(LATEX) $(SRC_NOTES6UP).tex
		rm -f $(NOTES_SRC).tex 

# create handouts, for the people to print
handout:	$(SRC).tex
		echo '\PassOptionsToClass{handout}{beamer}\input{$(SRC).tex}' > $(HANDOUT_SRC).tex
		$(LATEX) $(LATEXFLAGS) $(HANDOUT_SRC).tex
		$(LATEX) $(LATEXFLAGS) $(HANDOUT_SRC).tex
#		dvipdf $(HANDOUT_SRC)
#		pdfnup --nup "2x3" --offset ".25cm .25cm" --delta ".25cm .5cm" --frame true --scale 0.9 --outfile $(HANDOUT_SRC)6up.pdf  $(HANDOUT_SRC).pdf 
		pdfnup $(NUP) $(NUPOPTS) $(HANDOUT_SRC).pdf 
		rm -f $(HANDOUT_SRC).{tex,nav,log,out,snm,toc,dvi,pdf,aux}

# create handouts, for the people to print
handout12:	$(SRC).tex
		echo '\PassOptionsToClass{handout}{beamer}\input{$(SRC).tex}' > $(HANDOUT_SRC).tex
		$(LATEX) $(LATEXFLAGS) $(HANDOUT_SRC).tex
		$(LATEX) $(LATEXFLAGS) $(HANDOUT_SRC).tex
#		dvipdf $(HANDOUT_SRC)
		pdfnup $(NUP12) $(NUPOPTS) $(HANDOUT_SRC).pdf 
		rm -f $(HANDOUT_SRC).{tex,nav,log,out,snm,toc,dvi,pdf}

# create handouts, for the people to print
handout23:	$(SRC).tex
		echo '\PassOptionsToClass{handout}{beamer}\input{$(SRC).tex}' > $(HANDOUT_SRC).tex
		$(LATEX) $(LATEXFLAGS) $(HANDOUT_SRC).tex
		$(LATEX) $(LATEXFLAGS) $(HANDOUT_SRC).tex
#		dvipdf $(HANDOUT_SRC)
		pdfnup $(NUP23) $(NUPOPTS) $(HANDOUT_SRC).pdf 
		rm -f $(HANDOUT_SRC).{tex,nav,log,out,snm,toc,dvi,pdf}

# create handouts, for the people to print
handout33:	$(SRC).tex
		echo '\PassOptionsToClass{handout}{beamer}\input{$(SRC).tex}' > $(HANDOUT_SRC).tex
		$(LATEX) $(LATEXFLAGS) $(HANDOUT_SRC).tex
		$(LATEX) $(LATEXFLAGS) $(HANDOUT_SRC).tex
#		dvipdf $(HANDOUT_SRC)
		pdfnup $(NUP33) $(NUPOPTS) $(HANDOUT_SRC).pdf 
		rm -f $(HANDOUT_SRC).{tex,nav,log,out,snm,toc,dvi,pdf}

# create handouts, for the people to print
handout44:	$(SRC).tex
		echo '\PassOptionsToClass{handout}{beamer}\input{$(SRC).tex}' > $(HANDOUT_SRC).tex
		$(LATEX) $(LATEXFLAGS) $(HANDOUT_SRC).tex
		$(LATEX) $(LATEXFLAGS) $(HANDOUT_SRC).tex
#		dvipdf $(HANDOUT_SRC)
		pdfnup $(NUP44) $(NUPOPTS) $(HANDOUT_SRC).pdf 
		rm -f $(HANDOUT_SRC).{tex,nav,log,out,snm,toc,dvi,pdf}

# delete the logs
clean:		
		rm -f *.aux *.log *.out *.ps *.toc *.nav *.snm *.dvi
