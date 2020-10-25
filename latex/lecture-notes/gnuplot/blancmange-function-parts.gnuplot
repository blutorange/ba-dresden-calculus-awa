load "../../gnuplot-snippets/function-plot.gnuplot"

set title "Teile der Blancmange-Funktion" font ",22"

set xrange [0:3]
set yrange [0:1.5]

unset xtics
unset ytics

blanc(x,n) = tri(2**n*x)/2**n
tri(x) = abs(x-floor(x+0.5))

plot \
  blanc(x,0) + 0.00 lc 0 lw 5 notitle, \
  blanc(x,1) + 0.60 lc 0 lw 5 notitle, \
  blanc(x,2) + 1.00 lc 0 lw 5 notitle, \
  blanc(x,3) + 1.25 lc 0 lw 5 notitle

