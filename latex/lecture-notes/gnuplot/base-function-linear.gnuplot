load "../../gnuplot-snippets/function-plot.gnuplot"

set xrange [-3:3]
set yrange [-8:7]

set xtics 1
set ytics 2

plot 2*x-2 lc 0 lw 5 title "y=2*x-2"
