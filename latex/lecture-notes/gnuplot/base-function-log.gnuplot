load "../../gnuplot-snippets/function-plot.gnuplot"

set xrange [0:9]
set yrange [-3:5]

set xtics 1
set ytics 1

plot \
  log(x)/log(2) lc 0 lw 8 title "y=log_2(x)", \
  log(x)/log(0.5) lc 0 lw 4 title "y=log_{0.5}(x)"
