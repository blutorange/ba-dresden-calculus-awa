load "../../gnuplot-snippets/sfunction-plot.gnuplot"

set xrange [-1:1]
set yrange [-1:1]
set zrange [0:1]

set xtics 0.5
set ytics 0.5
set ztics 0.25
#set hidden3d
set isosamples 25
set ticslevel 0.0

set view 60, 20, 1, 1.2
splot 1-x*x-y*y lc 0 title "z=1-x^2-y^2"

