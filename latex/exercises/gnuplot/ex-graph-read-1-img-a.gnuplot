load "../../gnuplot-snippets/function-plot.gnuplot"

set xrange [-2:2]
set yrange [-3:3]

set xtics 0.5
set ytics 1

plot 2*sin(pi*x) lw 6 lc "#000000" title "f(x)"
