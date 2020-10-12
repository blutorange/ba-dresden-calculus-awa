load "template/function-plot.gnuplot"

set xrange [-270:270]
set yrange [-6:6]

set xtics 90
set ytics 2

set format x "%.0f°"

plot tan(2*pi*x/360) lc 0 lw 5 title "y=tan(x)"
