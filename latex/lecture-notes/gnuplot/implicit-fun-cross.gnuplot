load "template/function-plot.gnuplot"

set size square
@terminal 800 800

set xrange [-3:3]
set yrange [-3:3]

set xtics 1
set ytics 1

plot x lc 0 lw 4 title "|x| = |y|", -x lc 0 lw 4 notitle
  
