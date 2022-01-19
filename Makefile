.PHONY=clean

thoughts.pdf: thoughts.bbl
	pdflatex thoughts
	pdflatex thoughts

thoughts.bbl: thoughts.tex bibliography/bibliography.bib
	pdflatex thoughts
	biber thoughts

thoughts.tex: thoughts.md
	pandoc --biblatex --variable=biblio-style:apa --bibliography=bibliography/bibliography.bib -s -o thoughts.tex thoughts.md

clean:
	rm -f thoughts.aux thoughts.bcf thoughts.log thoughts.blg thoughts.run.xml thoughts.bbl thoughts.tex thoughts.pdf
