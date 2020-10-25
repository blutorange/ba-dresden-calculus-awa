load "../../gnuplot-snippets/function-plot.gnuplot"

set size square
@terminal 800 800

set xrange [-1.5:1.5]
set yrange [-1.5:1.5]

set xtics 0.5
set ytics 0.5

plot sqrt(1-x*x) lc 0 lw 4 title "x^2+y^2=1", -sqrt(1-x*x) lc 0 lw 4 notitle
  
