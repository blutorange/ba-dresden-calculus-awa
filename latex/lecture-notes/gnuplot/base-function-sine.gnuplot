load "template/function-plot.gnuplot"

set xrange [0:10]
set yrange [-3:6]

set xtics 1
set ytics 1

plot 4*sin(2*pi*0.25*(x-3))+1 lc 0 lw 5 title "y=4sin(2π*0.25*(x-3))+1"
