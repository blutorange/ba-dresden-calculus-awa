#!/usr/bin/env bash

set -e

# CLI flags
mode="";
while getopts :m:hc flag
do
    case "${flag}" in
        m)
            mode=${OPTARG}
        ;;
        h)
            echo 'To process all files and render the PDF from scratch, use';
            echo "  $0.sh";
            echo 'To process only part of the files, use:';
            echo "  $0  -m plot|pdf";
            echo '  -m plot : Only renders the gnuplot graphs';
            echo '  -m pdf  : Only renders the PDF via LaTeX';
            echo '  -m svg  : Only render all SVG images';
            echo '  -m clean: Removes all generated files';
            echo 'To remove all generated files:';
            echo "  $0 -c";
            echo '  This is a shortcut for "-m clean"';
            exit;
        ;;
        c)
            mode="clean";
        ;;
        \?)
            echo "Illegal options, use $0 -h ";
        ;;
    esac
done

# Remove all generated files
if [ "$mode" = "clean" ] 
then
    rm -f gnuplot/*.png;
    rm -f svg/*.png
    rm -f "lecture.aux" "lecture.fdb_latexmk" "lecture.fls" "lecture.log" "lecture.pdf" "lecture.out" "lecture.toc";
    rm -rf "_minted-lecture";
    exit;
fi

# Render all SVG images
if [ "$mode" = "svg" ] || [ -z "$mode" ]
then
    cd svg;
    for svgfile in $(ls *.svg)
    do
        svgimage="$(basename $svgfile .svg).png";
        inkscape -C -z --file="$svgfile" --export-png="$svgimage" --export-background=ffffff;
    done
    cd ..;
fi

# Render all gnuplot diagrams
if [ "$mode" = "plot" ] || [ -z "$mode" ]
then
    cd gnuplot;
    for plotfile in $(ls *.gnuplot)
    do
        plotimage="$(basename $plotfile .gnuplot)";
        gnuplot -e "filename='$plotimage'" "$plotfile";
    done
    cd ..;
fi

# Render the lecture notes PDF script
if [ "$mode" = "pdf" ] || [ -z "$mode" ]
then
    latexmk -pdf -shell-escape -halt-on-error lecture.tex;
fi
