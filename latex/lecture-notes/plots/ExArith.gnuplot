set key font ",24"
set tics font ",22" 

set xlabel "x-Achse" font ",22" 
set ylabel "y-Achse" font ",22" 

set xrange [-1:1]
set yrange [-2:4]

set grid
set xtics 0.25
set ytics 1
set grid ls 1 lc "#000000" lw 3 dt (15,10)

set zeroaxis ls 2 lw 5 lc "#000000"

set terminal pngcairo dashed size 800,500
set output filename

plot 2*cos(2*pi*x)+1 lw 6 lc "#000000" title "f(x)"

