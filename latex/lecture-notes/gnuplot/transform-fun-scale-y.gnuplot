load "../../gnuplot-snippets/function-plot.gnuplot"

set key outside above

set xrange [0:360]
set yrange [-2.0:2.0]

set xtics 90
set ytics 0.5

set format x "%.0f°"

plot \
  sin(x*pi/180) lc 0 lw 8 title "sin(x)", \
  2*sin(x*pi/180) lc "#3333aa" lw 4 title "2sin(x)", \
  0.5*sin(x*pi/180) lc "#aa3333" lw 4 title "1/2*sin(x)"

