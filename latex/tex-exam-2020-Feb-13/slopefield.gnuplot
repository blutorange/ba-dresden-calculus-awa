f(x,y) = sin(x)/exp(y)
xmin = -5.0
xmax = 5.0
ymin = -2.0
ymax = 1.25
samplesx = 80
samplesy = 120

##
set terminal png size 1280,720
set output "slopefield.png"

set xtics 1
set ytics 0.25

set key font ",24"
set tics font ",22" 

set style arrow 7 nohead ls 1 lw 2 lc "#666666"
set zeroaxis linestyle 1 linewidth 3 linecolor "#000000"

min(x,y)=x<y?x:y
max(x,y)=x<y?y:x
arr = (xmax-xmin)/max(1.0*samplesx,1.0*samplesy)*0.8
len(x,y) = arr/sqrt(1+f(x,y)**2)

set xrange [xmin:xmax]
set yrange [ymin:ymax]
set samples samplesx
set isosamples samplesy
plot "++" using 1:2:(len($1,$2)):(f($1,$2)*len($1,$2)) with vectors arrowstyle 7 title "", "<echo '0 -1'"   with points ls 7 ps 3 title "", "<echo '-3.5 -1.25'"   with points ls 7 ps 3 title "", "<echo '4 0 -1'"   with points ls 7 ps 3 title ""

##pause -1
