load "../../gnuplot-snippets/contour-line-plot.gnuplot"

set xrange [-4:4]
set yrange [-4:4]

set xtics 1
set ytics 1

set cntrparam levels discrete 0,1,4,9,16

splot x*x+y*y lw 5 lc 0 title "Konturlinien für x^2+y^2=(1,4,9,16)"
