load "template/function-plot.gnuplot"

set key outside above

set xrange [-4:4]
set yrange [-20:20]

set xtics 1
set ytics 4

plot \
  ((4*x-2)**2-6) / (10*x+2) lc 0 lw 5 title "y=((4x-2)^2-6) / (10x+2)", \
  1.6*x-48.0/25.0 lc "#33aa33" lw 3 notitle
 
