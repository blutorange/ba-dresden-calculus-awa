# Called from the main build script
set -e
shopt -s nullglob;
shopt -s globstar;

for exam in *.tex
do
    latexmk -pdf -shell-escape -halt-on-error "$exam";
done

