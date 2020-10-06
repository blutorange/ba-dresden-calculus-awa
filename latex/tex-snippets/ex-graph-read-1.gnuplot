# default settings

set xlabel "x-Achse" font "Times-Roman,22"
set ylabel "y-Achse" font "Times-Roman,22"

set style line 12 lc rgb '#505050' lt 0 lw 2
set style line 13 lc rgb '#202020' lt 1 lw 4
set grid ls 12
set zeroaxis ls 13

set key font ",24"
set tics font ", 22"

# custom

set xrange [-2:2]
set yrange [-3:3]

set xtics 0.5
set ytics 1

set terminal png
set output "ex-graph-read-1-img-a.png"

plot 2*sin(pi*x) lw 5 lc "#000000" title "f(x)"

