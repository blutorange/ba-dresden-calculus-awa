load "../../gnuplot-snippets/function-plot.gnuplot"

set key above

set xrange [-pi:2.5*pi]
set yrange [-1.5:3.5]

set format x "%.1Pπ"
set xtics pi/2
set ytics 1

plot  2*sin(-3*x-1/2.0*pi)+1 lw 6 lc "#000000"
