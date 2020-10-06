set key font ",24"
set key right top
set tics font ",22" 

set xlabel "x-Achse" font ",22" 
set ylabel "y-Achse" font ",22" 

set xrange [-pi:2.5*pi]
set yrange [-1.5:4]

set grid
set format x "%.1Pπ"; set xtics pi/2
set ytics 1
set grid ls 1 lc "#000000" lw 3 dt (10,15)

set zeroaxis ls 2 lw 5 lc "#000000"

set terminal pngcairo dashed size 800,500
set output "ex-fn-transform-5-a.png"

plot  2*sin(-3*x-1/2.0*pi)+1 lw 6 lc "#000000"
