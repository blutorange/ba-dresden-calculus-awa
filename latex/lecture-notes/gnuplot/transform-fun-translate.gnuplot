load "template/function-plot.gnuplot"

set key outside top right

set xrange [-4:4]
set yrange [-3:6]

set xtics 2
set ytics 2

plot \
  x**2 lc 0 lw 8 title "x^2", \
  (x-2)**2 lc "#aa3333" lw 4 title "(x-2)^2", \
  (x+2)**2 lc "#33aa33" lw 4 title "(x+2)^2", \
  x**2-2 lc "#3333aa" lw 4 title "x^2-2", \
  x**2+2 lc "#33aaaa" lw 4 title "x^2+2"

