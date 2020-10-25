# Default for plotting a slope field y'=f(x,y)

load "../../gnuplot-snippets/common.gnuplot"

set key font ",24" tmargin
set border back
set tics font ",22" 

set grid ls 1 lc "#000000" lw 2 dt (15,10)

set samples 20
set isosamples 20

set xlabel "x" font ",22" 
set ylabel "y" font ",22" 

set zeroaxis ls 2 lw 3 lc "#000000"

@terminal 800 800

scaling = 0.25
fx(x,y) = 1
fy(x,y) = diff(x,y)
vnorm(x,y) = sqrt(fx(x,y)**2 + fy(x,y)**2)
vx(x,y) = scaling * fx(x,y)/vnorm(x,y)
vy(x,y) = scaling * fy(x,y)/vnorm(x,y)

