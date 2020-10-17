load "template/function-plot.gnuplot"

set key outside above

set xrange [0:5]
set yrange [-2.25:2.25]

set xtics 1
set ytics 0.75

f1(x) = (x-0.5)
f2(x) = sin(5*(x-1.5))
f3(x) = -(x-2.5)**2-1
f4(x) = -1.5*tan(2.0*(x-3.5))
f5(x) = exp(x-4.5)

h(x) = \
  x == 1 ? 0.5*(f1(x)+f2(x)) : \
  x == 2 ? 0.5*(f2(x)+f3(x)) : \
  x == 3 ? 0.5*(f3(x)+f4(x)) : \
  x == 4 ? 0.5*(f4(x)+f5(x)) : \
  1/0
  
$data << EOD
 1
 2
 3
 4
EOD

plot \
  0 < x && x < 1 ? f1(x) : 1/0 lc 0 lw 5 title "f(x)", \
  1 < x && x < 2 ? f2(x) : 1/0 lc 0 lw 5 notitle, \
  2 < x && x < 3 ? f3(x) : 1/0 lc 0 lw 5 notitle, \
  3 < x && x < 4 ? f4(x) : 1/0 lc 0 lw 5 notitle, \
  4 < x && x < 5 ? f5(x) : 1/0 lc 0 lw 5 notitle, \
  $data u 1:(h($1)) with points pt 6 ps 3 lw 4 lc "#000000" title "Mittelwerte Fourier-Reihe", \
  $data u 1:(h($1)) with points pt 7 ps 3 lw 0 lc "#FFFFFF" notitle
