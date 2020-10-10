# Default for plotting a contour lines

load "template/common.gnuplot"

set key font ",24" tmargin
set border back
set tics font ",22" 

set grid
set grid ls 1 lc "#000000" lw 2 dt (15,10)

set samples 20
set isosamples 20

set xlabel "x" font ",22" 
set ylabel "y" font ",22" 

set zeroaxis ls 2 lw 3 lc "#000000"

unset surface
set contour base
set view 0,0,1,1

set terminal pngcairo dashed size 800,800

scaling = 0.25
epsilon = 1E-9
fx(x,y) = (f(x+epsilon,y)-f(x-epsilon,y))/(2*epsilon)
fy(x,y) = (f(x,y+epsilon)-f(x, y-epsilon))/(2*epsilon)
vnorm(x,y) = sqrt(fx(x,y)**2 + fy(x,y)**2)
vx(x,y) = scaling * fx(x,y)/vnorm(x,y)
vy(x,y) = scaling * fy(x,y)/vnorm(x,y)

