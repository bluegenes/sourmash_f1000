all: main.pdf

clean:
	-rm -f main.pdf main.aux main.out 

main.pdf: main.tex
	pdflatex main.tex
	pdflatex main.tex
