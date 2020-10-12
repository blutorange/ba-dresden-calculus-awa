f(x,y) = sin(1.3*x)*cos(0.9*y)+cos(.8*x)*sin(1.9*y)+cos(y*.2*x)

xmin       = -5
xmax       = 5
ymin       = -5
ymax       = 5
xtics      = 1
ytics      = 1
samples    = 250
isosamples = 250
colorsteps = 10
labelspace = 30
labelround = 1

set title "z = sin(1.3x)cos(0.9y)\n+cos(0.8x)sin(1.9y)+cos(0.2xy)"

load "template/contour-field-plot.gnuplot"

plot \
  'contour-data.dat' with image, \
  'contour-lines.dat' w l lc "#000000" lw 4 notitle

