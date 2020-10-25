load "../../gnuplot-snippets/function-plot.gnuplot"

set xrange [-3:3]
set yrange [0:1.5]

set xtics 1
set ytics 0.5

$data << EOD
 0 1
EOD

plot \
  sin(x)/x lc 0 lw 5 title "y=sin(x)/x", \
  $data with points pt 6 ps 3 lw 4 lc "#000000" notitle, \
  $data with points pt 7 ps 3 lw 0 lc "#FFFFFF" notitle
