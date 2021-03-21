
.PHONY: clean refreshloop

TMJT.pdf: TMJT.bbl
	pdflatex TMJT
	pdflatex TMJT

TMJT.bbl: TMJT.tex ../bibliography/bibliography.bib
	pdflatex TMJT
	biber TMJT

clean:
	rm -f TMJT.aux TMJT.bbl TMJT.bcf TMJT.blg TMJT.fff TMJT.log TMJT.out TMJT.pdf TMJT.run.xml

refreshloop:
	while inotifywait -e close_write TMJT.tex; do make; done


