load "template/function-plot.gnuplot"

set xrange [0:9]
set yrange [-3:5]

set xtics 1
set ytics 1

plot \
  sqrt(x) lc 0 lw 8 title "y=x^{1/2}", \
  -sqrt(x) lc 0 lw 4 title "y=-x^{1/2}"
