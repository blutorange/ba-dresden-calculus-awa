load "../../gnuplot-snippets/function-plot.gnuplot"

set key above

set xrange [-1:8]
set yrange [-1.1:1.1]

set format x "%.1Pπ";
set xtics pi/2
set ytics 1

plot \
  cos(2*(x-pi/2)) lw 6 lc "#000000" title "Skalierung+Verschiebung", \
  cos(2*x-pi/2) dt (15,10) lw 6 lc "#333333" title "Verschiebung+Skalierung"
