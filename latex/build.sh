#!/usr/bin/env bash

set -e;
shopt -s nullglob;
shopt -s globstar;

DEFAULT_DIRS="lecture-notes exercises exam"

# CLI flags
mode="";
dirs=$DEFAULT_DIRS;
while getopts :m:d:hpc flag
do
    case "${flag}" in
        m)
            mode=${OPTARG};
        ;;
        h)
            echo 'To process all files and render the PDF from scratch, use';
            echo "  $0.sh";
            echo 'To process only part of the files, use:';
            echo "  $0 -m plot|pdf";
            echo '  -m plot   : Only renders the gnuplot graphs';
            echo '  -m pdf    : Only renders the PDF via LaTeX';
            echo '  -m svg    : Only render all SVG images';
            echo '  -m clean  : Removes all generated files';
            echo '  -m release: Create a ZIP archive with all built files';
            echo 'To create a print-friendly version of the PDF files, use';
            echo "  $0 -p";
            echo 'To process only a specified sub directory, use';
            echo "  $0.sh -d <DIRECTORY>";
            echo 'To remove all generated files:';
            echo "  $0 -c";
            echo '  This is a shortcut for "-m clean"';
            exit;
        ;;
        d)
            dirs=${OPTARG};
        ;;
        c)
            mode="clean";
        ;;
        p)
            export TEXPRINT="true";
        ;;
        \?)
            echo "Illegal options, use $0 -h ";
        ;;
    esac
done

# Each directory with latex files
for subdir in $dirs
do

    cd "$subdir";

    # Remove all generated files
    if [ "$mode" = "clean" ] 
    then
        rm -f gnuplot/*.png;
        rm -f gnuplot/*.dat;
        rm -f svg/*.png;
        rm -f **/*.aux;
        rm -f **/*.fdb_latexmk;
        rm -f **/*.fls;
        rm -f **/*.log;
        rm -f **/*.pdf;
        rm -f **/*.out;
        rm -f **/*.toc;
        rm -rf **/_minted-*;
        bash "./clear.sh";
    else
        # Render all SVG images
        if [ "$mode" = "svg" ] || [ -z "$mode" ]
        then
        cd svg;
        for svgfile in *.svg
        do
          svgimage="$(basename $svgfile .svg).png";
          inkscape \
            -C \
            -z \
            --file="$svgfile" \
            --export-png="$svgimage" \
            --export-background=ffffff;
        done
        cd ..;
        fi

        # Render all gnuplot diagrams
        if [ "$mode" = "plot" ] || [ -z "$mode" ]
        then
            cd gnuplot;
            for plotfile in *.gnuplot
            do
                plotimage="$(basename $plotfile .gnuplot)";
                gnuplot -e "filename='$plotimage'" "$plotfile";
            done
            cd ..;
        fi

        # Render the lecture notes PDF script
        if [ "$mode" = "pdf" ] || [ -z "$mode" ]
        then
            bash "./make-tex.sh";
        fi
    fi
    
    cd ..;
done

if [ "$mode" = "release" ] || [ -z "$mode" ]
then
    zip release.zip **/*.pdf;
fi
