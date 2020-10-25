load "../../gnuplot-snippets/function-plot.gnuplot"

set key outside above

set xrange [0.5:0.7]
set yrange [0.5:0.7]

set xtics 0.05
set ytics 0.05

blanc(x,n) = tri(2**n*x)/2**n
tri(x) = abs(x-floor(x+0.5))

plot sum [n=0:20] blanc(x,n) lc 0 lw 2 title "Blancmange-Funktion"
