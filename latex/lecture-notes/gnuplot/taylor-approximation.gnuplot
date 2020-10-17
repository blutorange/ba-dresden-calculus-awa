load "template/function-plot.gnuplot"

set key outside above

set xrange [-11:11]
set yrange [-1:3]

set xtics 2
set ytics 1

@terminal 1000 500

fn(x,n) = (-1)**n * x**(2*n) / gamma(2*n+1)
taylor(x,k) = sum[i=0:k] fn(x,i)

plot \
      cos(x)  lc 0 lw 8 title "cos(x)", \
  taylor(x,2) lc "#aa3333" lw 5 title "F_2", \
  taylor(x,4) lc "#33aa33" lw 5 title "F_4", \
  taylor(x,6) lc "#3333aa" lw 5 title "F_6", \
  taylor(x,8) lc "#aaaa33" lw 5 title "F_8", \
  taylor(x,10) lc "#aa33aa" lw 5 title "F_{10}"

