# Default for plotting a univariate function

load "template/common.gnuplot"

set key font ",24"
set tics font ",22" 

set grid
set grid ls 1 lc "#000000" lw 2 dt (15,10)

set xlabel font ",22" 
set ylabel font ",22" 

set zeroaxis ls 2 lw 3 lc "#000000"

set xlabel "Argument x"
set ylabel "Funktionswert y"

set terminal pngcairo dashed size 800,500
