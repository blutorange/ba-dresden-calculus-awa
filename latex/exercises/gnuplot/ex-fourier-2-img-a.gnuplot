load "../../gnuplot-snippets/function-plot.gnuplot"

set samples 1000

set key outside above center

set xrange [0:6]
set yrange [0:1]

set xtics 1
set ytics 0.25

mod(x,y) = x-(floor(x/y)*y)
f(x,n) = 0.5-sum[i=1:n] (sin(2*pi/3*i*x))/(pi*i)
s(x) = mod(x,3)*1/3

@output 1
plot s(x) lw 3 lc "#000000" title "F(x)", f(x,0) lw 12 lc "#000000" title "n=0", f(x,1) lw 6 lc "#000000" title "n=1"

@output 2
plot s(x) lw 3 lc "#000000" title "Sägezahn", f(x,2) lw 6 lc "#000000" title "n=2"

@output 3
plot s(x) lw 3 lc "#000000" title "Sägezahn", f(x,3) lw 6 lc "#000000" title "n=3"

@output 4
plot s(x) lw 3 lc "#000000" title "Sägezahn", f(x,4) lw 6 lc "#000000" title "n=4"

@output 5
plot s(x) lw 3 lc "#000000" title "Sägezahn", f(x,10) lw 6 lc "#000000" title "n=10"

@output 6
plot s(x) lw 3 lc "#000000" title "Sägezahn", f(x,100) lw 6 lc "#000000" title "n=100"

