# Called from the main build script
set -e
latexmk -pdf -shell-escape -halt-on-error lecture.tex;
