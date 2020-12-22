set key font ",24"
set key left bottom
set tics font ",22" 

set xlabel "x-Achse" font ",22" 
set ylabel "y-Achse" font ",22" 

set xrange [-3:5]
set yrange [-2:4]

set grid
set xtics 1
set ytics 1
set grid ls 1 lc "#000000" lw 3 dt (10,15)

set zeroaxis ls 2 lw 5 lc "#000000"

set terminal pngcairo dashed size 800,500
set output "exam-2020-feb-trial-grid.png"

plot x/sin(x) lw 6 lc "#000000" title "f(x)", (x-2)/sin(x-2)-2 dt (15,10) lw 6 lc "#333333" title "g(x)"

