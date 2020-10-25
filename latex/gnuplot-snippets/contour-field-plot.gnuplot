# Default for plotting a contour field with colors

load "../../gnuplot-snippets/common.gnuplot"
contourdata='call "../../gnuplot-snippets/create-contour-data.gnuplot"'
contourlines='call "../../gnuplot-snippets/create-contour-lines.gnuplot"'

set samples samples
set isosamples isosamples

set xrange [xmin:xmax]
set yrange [ymin:ymax]

@contourdata "x*x+y*y"

# unset yrange so we get full range with stats
unset yrange
stats 'contour-data.dat' u 3
set cntrparam levels incremental STATS_min,(STATS_max-STATS_min)/(colorsteps),STATS_max
set cbrange [STATS_min:STATS_max]
set yrange [ymin:ymax]

set key font ",24"
set tics font ",22" 
set title font ",24"

set grid ls 1 lc "#000000" lw 2 dt (15,10)

set xtics xtics
set ytics ytics

unset clabel
set xlabel "x" font ",22" 
set ylabel "y" font ",22" 
unset zlabel

set zeroaxis ls 2 lw 3 lc "#000000"

unset surface
set contour base
set view 0,0,1,1

set palette rgbformulae 33,13,10
set palette maxcolors colorsteps

labels = '<../../gnuplot-snippets/contour-plot-labels.sh contour-lines.dat 0 '.labelspace.' 0 '.labelround
lines = '<../../gnuplot-snippets/contour-plot-labels.sh contour-lines.dat 1 '.labelspace.' 0 '.labelround

@contourlines

@terminal 800 600
