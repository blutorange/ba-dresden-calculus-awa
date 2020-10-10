# Default for plotting a set of data points

load "template/common.gnuplot"

set key font ",24"
set tics font ",22" 

set grid
set grid ls 1 lc "#000000" lw 1 dt (15,10)

set xlabel font ",22" 
set ylabel font ",22" 

set zeroaxis ls 2 lw 5 lc "#000000"

set terminal pngcairo dashed size 800,500

