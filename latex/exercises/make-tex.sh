# Called from the main build script
set -e
shopt -s nullglob;
shopt -s globstar;

for year in year-*
do
    cd $year;
    for exercise in *.tex
    do
        latexmk -pdf -shell-escape -halt-on-error "$exercise";
    done
    cd ..;
done

