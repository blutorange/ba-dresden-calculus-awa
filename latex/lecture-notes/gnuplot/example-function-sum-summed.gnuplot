load "../../gnuplot-snippets/function-plot.gnuplot"

set key outside above

set xrange [-1:1]
set yrange [0:1.25]

set xtics 0.25
set ytics 0.25

f(x,n) = x*x*(1-x*x)**n

plot \
  sum [n=0:0] f(x,n) lc 0 lw 8 title "y=F_0(x)", \
  sum [n=0:1] f(x,n) lc 0 lw 7 title "y=F_1(x)", \
  sum [n=0:5] f(x,n) lc 0 lw 6 title "y=F_{5}(x)", \
  sum [n=0:10] f(x,n) lc 0 lw 5 title "y=F_{10}(x)", \
  sum [n=0:20] f(x,n) lc 0 lw 4 title "y=F_{20}(x)", \
  sum [n=0:100] f(x,n) lc 0 lw 3 title "y=F_{100}(x)"

