ssc2013
=======

SSC 2013 presentation files

* `fig/` old figures imported here
* `figures/` new figures
* `frames/` .tex files included via \input{}
* R/ R source to create figures/

Makefile:

* `make` runs `pdflatex -interaction=nonstopmode ssc2013.tex`
* `make handout` uses `pdfnup --nup 2x2 ...`
* See <a href="http://go.warwick.ac.uk/pdfjam"> pdfjam website</a> (unix only)

