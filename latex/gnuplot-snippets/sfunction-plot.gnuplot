# Default for plotting a function of two variables

load "../../gnuplot-snippets/common.gnuplot"

set key font ",24"
set tics font ",22" 

set grid
set grid ls 1 lc "#000000" lw 2 dt (15,10)

set samples 100

set xlabel font ",22" 
set ylabel font ",22" 
set zlabel font ",22" 

set zeroaxis ls 2 lw 3 lc "#000000"

set xlabel "x"
set ylabel "y"
set zlabel "z"

set terminal pngcairo dashed size 800,600
