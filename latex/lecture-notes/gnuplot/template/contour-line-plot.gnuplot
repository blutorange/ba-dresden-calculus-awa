# Default for plotting a contour lines

load "template/common.gnuplot"

set key font ",24"
set tics font ",22" 

set grid
set grid ls 1 lc "#000000" lw 2 dt (15,10)

set samples 200
set isosamples 200
set cntrparam cubicspline points 200

unset clabel
set xlabel "x" font ",22" 
set ylabel "y" font ",22" 
unset zlabel

set zeroaxis ls 2 lw 3 lc "#000000"

unset surface
set contour base
set view 0,0,1,1

set terminal pngcairo dashed size 800,600
