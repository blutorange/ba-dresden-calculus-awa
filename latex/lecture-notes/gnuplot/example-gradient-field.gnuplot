load "../../gnuplot-snippets/gradient-field-plot.gnuplot"

set xrange [-4:4]
set yrange [-4:4]

set xtics 1
set ytics 1

set samples 20
set isosamples 20

f(x,y) = 1-x*x-y*y

@gplotmono 0.35 0.08 20 60 3 "z=1-x^2-y^2"
