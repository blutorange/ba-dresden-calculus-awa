load "template/function-plot.gnuplot"

set key bottom center

set xrange [-5:5]
set yrange [-20:20]

set xtics 2
set ytics 5

$data << EOD
 -4.5 -13.390625 1
 -3 18.25 2
 0 -2 3
 3 18.25 4
 4.5 -13.390625 5
 2 12 x
 -2 12 x
EOD

f(x) = abs(x)<=4.5 ? -0.25*x**4+9/2.0*x**2-2 : 1/0
fx = "y=-x^2/4+9/2x^2-2"

plot \
  f(x) lc 0 lw 5 title fx, \
  $data u 1:2 with points pt 6 ps 5 lw 4 lc "#000000" notitle, \
  $data u 1:2 with points pt 7 ps 5 lw 0 lc "#FFFFFF" notitle, \
  $data with labels offset 0,0 font ",22" notitle
 
