load "../../gnuplot-snippets/function-plot.gnuplot"

set key top center

set xrange [-1:1.5]
set yrange [-1:2]

set xtics 0.5
set ytics 1

fn(x,n) = (-1)**(n+1.0) / (1.0*n) * x**n 

plot \
  log(1+x) lc 0 lw 8 title "ln(1+x)", \
  sum [k=1:2] fn(x,k) lc 0 lw 4 title "F_2(x)"
