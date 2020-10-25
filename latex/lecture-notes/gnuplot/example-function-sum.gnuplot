load "../../gnuplot-snippets/function-plot.gnuplot"

set key outside above

set xrange [-1:1]
set yrange [0:0.5]

set xtics 0.25
set ytics 0.1

f(x,n) = x*x*(1-x*x)**n

plot \
  f(x,0) lc 0 lw 8 title "y=f_0(x)", \
  f(x,1) lc 0 lw 7 title "y=f_1(x)", \
  f(x,2) lc 0 lw 6 title "y=f_2(x)", \
  f(x,3) lc 0 lw 5 title "y=f_3(x)", \
  f(x,4) lc 0 lw 4 title "y=f_4(x)", \
  f(x,5) lc 0 lw 3 title "y=f_5(x)", \
  f(x,6) lc 0 lw 2 title "y=f_6(x)", \
  f(x,8) lc 0 lw 1 title "y=f_7(x)"

