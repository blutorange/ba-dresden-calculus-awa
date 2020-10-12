load "template/function-plot.gnuplot"

set key outside above

set xrange [-4:4]
set yrange [0:8]

set xtics 2
set ytics 2

plot \
  x**2 lc 0 lw 8 title "f(x)", \
  (2*x-2)**2 lc 0 lw 4 title "f(2x-2)", \
  (2*(x-2))**2 dashtype "--.." lc 0 lw 4 title "f(2(x-2))"

