# slope field
phi(x,y) = sin(1.5*y)*cos(2*x)
scaling(x,y) = 0.15;
Dx(x,y) = 1
Dy(x,y) = phi(x,y)
enorm(x,y) = sqrt(Dx(x,y)**2+Dy(x,y)**2)
dx(x,y) = Dx(x,y)/enorm(x,y)*scaling(x,y)
dy(x,y) = Dy(x,y)/enorm(x,y)*scaling(x,y)

set samples 40    # x-axis
set isosamples 40 # y-axis
set palette defined ( \
    1 '#fffcf6', \
    2 '#fff7db', \
    3 '#fff4c2', \
    4 '#feecae', \
    5 '#f8ca8c', \
    6 '#f0a848', \
    7 '#c07860', \
    8 '#a86060', \
    9 '#784860', \
   10 '#604860')

set key font ",24"
set tics font ",22" 

set xlabel "x-Achse" font ",22" 
set ylabel "y-Achse" font ",22" 

set grid
set xtics 0.5
set ytics 1
set grid ls 1 lc "#000000" lw 3 dt (15,10)
set zeroaxis ls 2 lw 3 lc "#000000"

set xrange [-2:3]
set yrange [-2:3]

set key right tmargin

C1 = 0

set terminal pngcairo dashed size 800,500
set output "grid-trial.png"

plot '++' u ($1-dx($1,$2)/2.0):($2-dy($1,$2)/2.0):\
    (dx($1,$2)):(dy($1,$2)) \
    with vectors nohead lw 3 lc 0 title "Richtungsfeld", 4/3.0*atan(1/exp(-3/4.0*(C1+sin(2*x)))) lc '#888888' lw 6 title "p(x)"

