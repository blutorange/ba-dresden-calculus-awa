load "../../gnuplot-snippets/function-plot.gnuplot"

set key top left

set xrange [-4:4]
set yrange [-4:4]

set xtics 1
set ytics 1

plot \
  exp(x) lc 0 lw 8 title "y=e^x", \
  log(x) lc 0 lw 4 title "y=ln(x)", \
  x lc 0 lw 4 notitle
