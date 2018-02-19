# LaTeX Makefile for dvi, ps, and pdf file creation.
# By Jeffrey Humpherys
# Written April 05, 2004
# Revised January 13, 2005
# Thanks Bjorn and Boris
#
# Usage:
# make          # make dvi, ps, and pdf
# make dvi      # make dvi
# make ps       # make ps (and dvi)
# make pdf      # make pdf
#

MAIN		= main 

all: dvi ps pdf
#all: dvi ps

pdf: ${MAIN}.pdf
ps: ${MAIN}.ps
dvi: ${MAIN}.dvi

${MAIN}.pdf: ${MAIN}.ps
	ps2pdf14 -dPDFSETTINGS=/prepress -dEmbedAllFonts=true ${MAIN}*.ps &

${MAIN}.ps: ${MAIN}.dvi
#dvips -Ppdf -Pcmz -Pamz -t letter -D 600 -G0 -o ${MAIN}.ps ${MAIN}.dvi
	dvips -Ppdf -t letter -D 600 -G0 -o ${MAIN}.ps ${MAIN}.dvi

${MAIN}.dvi : ${MAIN}.tex
	latex --interaction=nonstopmode ${MAIN}.tex

clean:
	rm -f ./*.aux~
	rm -f ./*.tex~
	rm -f ./${MAIN}.dvi
	rm -f ./${MAIN}.ps
	rm -f ./${MAIN}.pdf
	rm -f ./${MAIN}.log
	rm -f ./${MAIN}.aux
