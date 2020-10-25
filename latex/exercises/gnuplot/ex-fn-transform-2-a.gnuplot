load "../../gnuplot-snippets/function-plot.gnuplot"

set xrange [-3:2]
set yrange [-3:10]

set xtics 1
set ytics 1

plot \
  2*(x+1)**3+4 lw 6 lc "#000000" title "p(x)", \
  x**3 dt (15,10) lw 6 lc "#333333" title "x^3"
