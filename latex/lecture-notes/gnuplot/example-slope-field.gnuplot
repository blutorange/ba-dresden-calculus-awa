diff(x,y) = -y/x
f(x,C) = C/x

set xrange [-4:4]
set yrange [-4:4]

set table 'slope-sol-1.dat'
plot f(x, 2)
set table 'slope-sol-2.dat'
plot f(x, 6)
set table 'slope-sol-3.dat'
plot f(x, -1)
set table 'slope-sol-4.dat'
plot f(x, -9)
unset table

load "template/slope-field-plot.gnuplot"

set xtics 1
set ytics 1

scaling = 0.35

$data << DATA
 1 2
 2 3
 -1 1
 -3 3
DATA

plot \
  '++' u ($1-vx($1,$2)/2.0):($2-vy($1,$2)/2.0):(vx($1,$2)):(vy($1,$2)):(vnorm($1,$2)) with vectors head size 0.08,20,60 lw 2 lc "#000000" title "y'=-y/x", \
  "slope-sol-1.dat" u 1:2 w l lw 4 lc "#aa3333" notitle, \
  "slope-sol-2.dat" u 1:2 w l lw 4 lc "#33aa33" notitle, \
  "slope-sol-3.dat" u 1:2 w l lw 4 lc "#3333aa" notitle, \
  "slope-sol-4.dat" u 1:2 w l lw 4 lc "#aa33aa" notitle, \
  $data with points pt 6 ps 3 lw 4 lc "#000000" notitle, \
  $data with points pt 7 ps 3 lw 0 lc "#FFFFFF" notitle
