load "../../gnuplot-snippets/function-plot.gnuplot"

set xrange [-2:1]
set yrange [-3:2]

set xtics 0.5
set ytics 1

plot -8*(x+1.5)*(x+1)*x*(x-0.5) lw 6 lc "#000000" title "f(x)"

