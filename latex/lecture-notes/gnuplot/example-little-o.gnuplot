load "../../gnuplot-snippets/function-plot.gnuplot"

set key outside above

set xrange [0:300000]
set yrange [0:10e130]

set xtics 100000

set logscale y

plot \
  x**20+10000 lc "#000000" lw 8 title "y=x^{20}+10000", \
  exp(0.001*x) lc "#000000" lw 4 title "y=e^{0.001x}"
 
