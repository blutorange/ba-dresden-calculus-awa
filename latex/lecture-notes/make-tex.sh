# Called from the main build script
set -e;
shopt -s nullglob;
shopt -s globstar;

latexmk -pdf -shell-escape -halt-on-error lecture.tex;
