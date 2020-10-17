# Default for plotting a univariate function

load "template/common.gnuplot"

set key font ",24" opaque
set tics font ",22" 

set grid
set grid ls 1 lc "#000000" lw 2 dt (15,10)

set xlabel font ",22" 
set ylabel font ",22" 

set zeroaxis ls 2 lw 3 lc "#000000"

set xlabel "x"
set ylabel "y"

a0(m) = 1.0/(2.0*m) * sum[i1=0:2*m-1] (f(T/2.0/m*i1))
an(n,m) = 1.0/m * sum[i2=0:2*m-1] (f(T/2.0/m*i2)*cos(pi/m*n*i2))
bn(n,m) = 1.0/m * sum[i=0:2*m-1] (f(T/2.0/m*i)*sin(pi/m*n*i))
am(m) = 1.0/(2.0*m) * sum[i3=0:2*m-1] (f(T/2.0/m*i3)*cos(i3*pi))
fourier(x,m,s) = a0(m) + (sum[k1=1:s] (an(k1,m) * cos(2*pi/T*k1*x))) + (sum[k2=1:s] (bn(k2,m) * sin(2*pi/T*k2*x))) + (s==m ? am(m) * cos(2*pi/T*k*x): 0)

@terminal 800 500
