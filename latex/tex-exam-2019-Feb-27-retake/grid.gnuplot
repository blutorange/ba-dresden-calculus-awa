set key font ",24"
set tics font ",22" 

set xrange [-2:2]
set yrange [-3:3]

set grid
set xtics 0.5
set ytics 1
set grid linewidth 2

set zeroaxis linewidth 3

plot 2*sin(pi*x) lw 5 lc "#000000" title "f(x)", -2+pi**2*(x+0.5)**2-pi**4/12.0*(x+0.5)**4 title "t(x)" lw 6 lc "#aaaaaa" dt "."

pause -1
