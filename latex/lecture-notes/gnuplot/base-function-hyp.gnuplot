load "../../gnuplot-snippets/function-plot.gnuplot"

set key top center

set xrange [-2:2]
set yrange [-4:5]

set xtics 1
set ytics 2

plot \
  sinh(x) lc 0 lw 8 title "y=sinh(x)", \
  cosh(x) lc 0 lw 4 title "y=cosh(x)"
  
