set key font ",24"
set key right top
set tics font ",22" 

set xlabel "x-Achse" font ",22" 
set ylabel "y-Achse" font ",22" 

set xrange [-3:2]
set yrange [-3:10]

set grid
set xtics 1
set ytics 1
set grid ls 1 lc "#000000" lw 3 dt (10,15)

set zeroaxis ls 2 lw 5 lc "#000000"

set terminal pngcairo dashed size 800,500
set output "ex-fn-transform-2-a.png"

plot 2*(x+1)**3+4 lw 6 lc "#000000" title "p(x)", x**3 dt (15,10) lw 6 lc "#333333" title "x^3"

