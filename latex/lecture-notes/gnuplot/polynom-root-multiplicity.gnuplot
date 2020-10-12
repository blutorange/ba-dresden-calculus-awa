load "template/function-plot.gnuplot"

set key bottom right

set xrange [-4:4]
set yrange [-4:5]

set xtics 1
set ytics 2

plot 0.5*(x-2)**2*(x+2) lc 0 lw 4 title "y=0.5*(x-2)^2+(x+2)"
  
