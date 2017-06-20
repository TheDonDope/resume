all: html pdf docx rtf

pdf: index.pdf
index.pdf: index.md
	pandoc --standalone --template assets/vendor/style.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o index.tex index.md; \
	context index.tex

html: index.html
index.html: assets/vendor/style.css index.md
	pandoc --standalone -H assets/vendor/style.css \
				--from markdown --to html \
				-o index.html index.md

docx: index.docx
index.docx: index.md
	pandoc -s -S index.md -o index.docx

rtf: index.rtf
index.rtf: index.md
	pandoc -s -S index.md -o index.rtf

clean:
	rm -f index.html
	rm -f index.tex
	rm -f index.tuc
	rm -f index.log
	rm -f index.pdf
	rm -f index.docx
	rm -f index.rtf
