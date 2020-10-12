load "template/function-plot.gnuplot"

set key outside above

set xrange [0:360]
set yrange [-1.0:1.0]

set xtics 90
set ytics 0.5

set format x "%.0f°"

plot \
  sin(x*pi/180) lc 0 lw 8 title "sin(x)", \
  sin(2*x*pi/180) lc "#3333aa" lw 4 title "sin(2x)", \
  sin(0.5*x*pi/180) lc "#aa3333" lw 4 title "sin(1/2*x)"

