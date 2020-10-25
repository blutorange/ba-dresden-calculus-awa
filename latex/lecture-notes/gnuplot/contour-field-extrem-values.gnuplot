f(x,y) = (x*y + 1 / x + 1 / y)

xmin       = 0.5
xmax       = 2
ymin       = 0.5
ymax       = 2
xtics      = 0.25
ytics      = 0.25
samples    = 250
isosamples = 250
colorsteps = 20
labelspace = 30
labelround = 1

set title "z = xy+1/x+1/y"

load "../../gnuplot-snippets/contour-field-plot.gnuplot"

plot \
  'contour-data.dat' with image, \
  'contour-lines.dat' w l lc "#000000" lw 4 notitle

