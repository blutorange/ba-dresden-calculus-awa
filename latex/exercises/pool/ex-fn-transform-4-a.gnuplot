set key font ",24"
set key right top
set tics font ",22" 

set xlabel "x-Achse" font ",22" 
set ylabel "y-Achse" font ",22" 

set xrange [-1:8]
set yrange [-1.1:2]

set grid
set format x "%.1Pπ"; set xtics pi/2
set ytics 1
set grid ls 1 lc "#000000" lw 3 dt (10,15)

set zeroaxis ls 2 lw 5 lc "#000000"

set terminal pngcairo dashed size 800,500
set output "ex-fn-transform-4-a.png"

plot  cos(2*(x-pi/2))  lw 6 lc "#000000" title "Skalierung+Verschiebung", cos(2*x-pi/2) dt (15,10) lw 6 lc "#333333" title "Verschiebung+Skalierung"

