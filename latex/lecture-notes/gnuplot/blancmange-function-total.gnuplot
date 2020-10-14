load "template/function-plot.gnuplot"

set key outside above

set xrange [0:3]
set yrange [0:0.8]

set xtics 1
set ytics 0.25

blanc(x,n) = tri(2**n*x)/2**n
tri(x) = abs(x-floor(x+0.5))

plot sum [n=0:10] blanc(x,n) lc 0 lw 2 title "Blancmange-Funktion"
