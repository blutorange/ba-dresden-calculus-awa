set key font ",24"
set tics font ",22" 

set xlabel "x-Achse" font ",22" 
set ylabel "y-Achse" font ",22" 

set xrange [-2:2]
set yrange [-3:3]

set grid
set xtics 0.5
set ytics 1
set grid ls 1 lc "#000000" lw 3 dt (15,10)

set zeroaxis ls 2 lw 5 lc "#000000"

set terminal pngcairo dashed size 800,500

fmod(x,n) = (x*1.0) - (n*1.0) * floor(x/(n*1.0))
f(x,a,b) = x >= a && x < b ? 2*cos(0.5*pi*fmod(x,1)) : 1/0 

set output "exam-2021-feb-grid.png"
plot 0 lw 0 notitle

set output "exam-2021-feb-grid-solution.png"
plot \
  f(x,-2,-1) lw 6 lc "#000000" title "f(x)", \
  f(x,-1,0) lw 6 lc "#000000" notitle, \
  f(x,0,1) lw 6 lc "#000000" notitle, \
  f(x,1,2) lw 6 lc "#000000" notitle  
  
