load "template/function-plot.gnuplot"

set xrange [-5:5]
set yrange [-5:5]

set xtics 1
set ytics 1

plot 1/x lc 0 lw 4 title "y=1/x"
  
