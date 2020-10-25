alpha=0.5
K=4
diff(x,y) = alpha*y*(K-y)
f(x,C) = K*exp(K*alpha*(x-C)) / (exp(K*alpha*(x-C)) + 1)

set key above

set xrange [-4:4]
set yrange [0:4]

set table 'slope-sol-1.dat'
plot f(x, -3)
set table 'slope-sol-2.dat'
plot f(x, -1)
set table 'slope-sol-3.dat'
plot f(x, 1)
set table 'slope-sol-4.dat'
plot f(x, 3)
unset table

load "template/slope-field-plot.gnuplot"

set samples 40
set isosamples 40

set xtics 2
set ytics 1

scaling = 0.20

plot \
  '++' u ($1-vx($1,$2)/2.0):($2-vy($1,$2)/2.0):(vx($1,$2)):(vy($1,$2)):(vnorm($1,$2)) with vectors head size 0.08,0,0 lw 2 lc "#000000" notitle, \
  "slope-sol-1.dat" u 1:2 w l lw 3 lc "#aa3333" title "C=-3", \
  "slope-sol-2.dat" u 1:2 w l lw 3 lc "#33aa33" title "C=-1", \
  "slope-sol-3.dat" u 1:2 w l lw 3 lc "#3333aa" title "C=+1", \
  "slope-sol-4.dat" u 1:2 w l lw 3 lc "#aa33aa" title "C=+3"
