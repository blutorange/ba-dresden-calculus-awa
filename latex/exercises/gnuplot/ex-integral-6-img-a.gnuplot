load "../../gnuplot-snippets/function-plot.gnuplot"

set key above

set xrange [-5:5]
set yrange [-0.5:5]

set xtics 1
set ytics 1

set xlabel "x-Achse" font "Times-Roman,22"
set ylabel "y-Achse" font "Times-Roman,22"

plot 2/(x**2)+1 lw 7 lc rgb '#000000' title "2/x^2+1"
