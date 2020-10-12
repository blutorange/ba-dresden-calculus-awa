load "template/function-plot.gnuplot"

set xrange [-3:4]
set yrange [0:9]

set xtics 1
set ytics 1

plot \
  exp(0.5*x) lc 0 lw 8 title "y=e^{0.5*x}", \
  exp(-0.5*x) lc 0 lw 4 title "y=e^{-0.5*x}"

