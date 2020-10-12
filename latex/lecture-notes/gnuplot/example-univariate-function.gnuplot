load "template/function-plot.gnuplot"

set xrange [-3:3]
set yrange [-1.5:1.5]

set xtics 1
set ytics 0.5

plot sin(pi*x) lc 0 lw 5 title "y=sin(π*x)"
