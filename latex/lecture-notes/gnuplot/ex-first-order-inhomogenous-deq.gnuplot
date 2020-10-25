diff(x,y) = y/x+x*cos(x)
f(x,C) = x*sin(x)+C*abs(x)

set key above

set xrange [-10:10]
set yrange [-18:18]
set urange [-10:10]
set vrange [-18:18]

set table 'slope-sol-1.dat'
plot f(x, -1)
set table 'slope-sol-2.dat'
plot f(x, +1)
# set table 'slope-sol-3.dat'
# plot f(x, 1)
# set table 'slope-sol-4.dat'
# plot f(x, 3)
unset table

load "../../gnuplot-snippets/slope-field-plot.gnuplot"

set samples 40
set isosamples 40

set xtics 5
set ytics 6

scaling = 0.50

plot \
  '++' u ($1-vx($1,$2)/2.0):($2-vy($1,$2)/2.0):(vx($1,$2)):(vy($1,$2)):(vnorm($1,$2)) with vectors head size 0.08,0,0 lw 2 lc "#000000" notitle, \
  "slope-sol-1.dat" u 1:2 w l lw 5 lc "#000000" title "C=-1", \
  "slope-sol-2.dat" u 1:2 w l lw 3 lc "#000000" title "C=+1"
