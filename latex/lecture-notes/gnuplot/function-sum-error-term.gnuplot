load "../../gnuplot-snippets/function-plot.gnuplot"

set key outside above

set xrange [-1:1]
set yrange [0:1.25]

set xtics 0.25
set ytics 0.25

f(x,n) = x*x*(1-x*x)**n

set arrow from -0.75,0.80859375, graph 0 to -0.75,1, graph 1 nohead  lw 5 lc "#aa3333"

set arrow from -0.50,0.4375, graph 0 to -0.50,1, graph 1 nohead  lw 5 lc "#aa3333"

set arrow from -0.25,0.12109375, graph 0 to -0.25,1, graph 1 nohead  lw 5 lc "#aa3333"

set arrow from 0.75,0.80859375, graph 0 to 0.75,1, graph 1 nohead  lw 5 lc "#aa3333"

set arrow from 0.50,0.4375, graph 0 to 0.50,1, graph 1 nohead  lw 5 lc "#aa3333"

set arrow from 0.25,0.12109375, graph 0 to 0.25,1, graph 1 nohead  lw 5 lc "#aa3333"

plot \
  1 lc 0 lw 8 title "F(x)", \
  sum [n=0:1] f(x,n) lc 0 lw 4 title "F_1(x)", \
  1 - sum [n=0:1] f(x,n) lc "#33aa33" lw 4 title "R_1(x)"

