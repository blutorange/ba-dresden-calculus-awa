load "../../gnuplot-snippets/function-plot.gnuplot"

set title "Gebiet berenzt durch 0<=x<=π, 0<=y<=sin(x)"

set key bottom

set samples 1000
set format x "%.1Pπ";

set xrange [-1.5*pi:1.5*pi]
set yrange [-1:1]

set xtics 0.5*pi
set ytics 0.5

plot x>=0&&x<=pi ? sin(x) : 1/0 with filledcurves lw 2 lc "#000000" notitle, sin(x) lw 6 lc "#000000" title "sin(x)"
