load "../../gnuplot-snippets/function-plot.gnuplot"

set xrange [-5:1]
set yrange [-4:5]

set xtics 1
set ytics 2

plot (x+2)**2-4 lc 0 lw 5 title "y=(x+2)^2-4"
