load "template/function-plot.gnuplot"

set key top left

set xrange [-3:3]
set yrange [-1.5:2]

set xtics 1
set ytics 0.75

$data << EOD
 0 0
EOD

plot \
  x < 0 ? -1 : 1/0 lc 0 lw 5 title "y=sgn(x)", \
  x > 0 ? 1 : 1/0 lc 0 lw 5 notitle, \
  $data with points pt 6 ps 3 lw 4 lc "#000000" notitle, \
  $data with points pt 7 ps 3 lw 0 lc "#FFFFFF" notitle
