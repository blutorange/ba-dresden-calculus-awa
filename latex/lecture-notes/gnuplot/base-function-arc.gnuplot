load "template/function-plot.gnuplot"

set key right

set xrange [-1:1]
set yrange [-90:180]

set xtics 0.25
set ytics 30

set format y "%.0f°"

plot \
  asin(x)*180/pi lc 0 lw 8 title "y=asin(x)", \
  acos(x)*180/pi lc 0 lw 4 title "y=acos(x)"

