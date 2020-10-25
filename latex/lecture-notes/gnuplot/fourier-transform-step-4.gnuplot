load "../../gnuplot-snippets/fourier-transform-plot.gnuplot"

set key outside above

set xrange [0:2.5]
set yrange [-0.2:1.2]

set xtics 0.5
set ytics 0.25

T=1
f(x) = (sgn(x-floor(x)-0.5)+1)/2

plot \
  f(x) lc 0 lw 4 title "f(x)", \
  fourier(x, 50, 7) lc 0 lw 6 title "Fourier-Reihe n=7"

