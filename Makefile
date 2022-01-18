thoughts.pdf: thoughts.tex bibliography/bibliography.bib
	pdflatex thoughts
	biber thoughts
	pdflatex thoughts
	pdflatex thoughts

thoughts.tex: thoughts.md
	pandoc --biblatex --variable=biblio-style:apa --bibliography=bibliography/bibliography.bib -s -o thoughts.tex thoughts.md
