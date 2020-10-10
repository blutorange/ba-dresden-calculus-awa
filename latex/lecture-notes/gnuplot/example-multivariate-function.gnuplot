load "template/sfunction-plot.gnuplot"

set xrange [-3:3]
set yrange [-3:3]
set zrange [0:12]

set xtics 1
set ytics 1
set ztics 4
set isosamples 30

@output 1
set view 60, 20, 1, 1.2
splot 12-(x*x+y*sin(y)) lc 0 title "z=12-(x^2+y*sin y)"

@output 2
set view 80, 70, 1, 1.2
splot 12-(x*x+y*sin(y)) lc 0 title "Schrägsicht"

@output 3
set xtics 1
set ytics 9000
set xlabel "x" offset 0,-1.5
set ylabel ""
set view 90, 0, 1, 1.2
splot 12-(x*x+y*sin(y)) lc 0 title "Seitensicht - x"

@output 4
unset xtics
set ytics 1
set xlabel ""
set ylabel "y" offset 0,1.5
set view 90, 90, 1, 1.2
splot 12-(x*x+y*sin(y)) lc 0 title "Seitensicht - y"
