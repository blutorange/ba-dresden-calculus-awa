load "template/function-plot.gnuplot"

set key outside above

set xrange [-2:2]
set yrange [-12:12]

set xtics 1
set ytics 4

$data << EOD
 0 -1
 1 0
EOD

set arrow from -0.2, graph 0 to -0.2, graph 1 nohead lw 3 lc "#33aa33"

plot \
  ((4*x-2)**2-6) / (10*x+2) lc 0 lw 5 title "y=((4x-2)^2-6) / (10x+2)", \
  $data with points pt 6 ps 3 lw 4 lc "#000000" notitle, \
  $data with points pt 7 ps 3 lw 0 lc "#FFFFFF" notitle
  # 1.6*x-48.0/25.0 lc "#33aa33" lw 3 notitle
 
