f(x,y) = x*x+y*y

xmin       = -4
xmax       = 4
ymin       = -4
ymax       = 4
xtics      = 1
ytics      = 1
samples    = 250
isosamples = 250
colorsteps = 8
labelspace = 30
labelround = 0

set title "z=x^2+y^2"

load "../../gnuplot-snippets/contour-field-plot.gnuplot"

load labels

plot \
  'contour-data.dat' with image, \
  lines w l lc "#000000" lw 4 notitle
  
