set xlabel "x-Achse" font "Times-Roman,22"
set ylabel "y-Achse" font "Times-Roman,22"

set style line 12 lc rgb '#505050' lt 0 lw 2
set style line 13 lc rgb '#202020' lt 1 lw 4
set grid ls 12
set zeroaxis ls 13

set key font ",20"
set tics font ", 22"

set xtics 1
set ytics 1
set xrange [-5:5]
set yrange [-0.5:5]

set terminal png
set output "ex-integral-6-img-a.png"

plot 2/(x**2)+1 lw 7 lc rgb '#000000' title "2/x^2+1"
