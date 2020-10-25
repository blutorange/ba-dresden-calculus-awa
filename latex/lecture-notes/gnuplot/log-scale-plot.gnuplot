load "../../gnuplot-snippets/function-plot.gnuplot"

set xrange [-1:5]
set yrange [0:100000]

set xtics 1

set logscale y

plot 10**x lc 0 lw 5 title "y=10^x"

