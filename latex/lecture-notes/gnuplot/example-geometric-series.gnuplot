load "template/data-plot.gnuplot"

set xlabel "Index n"
set ylabel "Folgenglied a_n"

set xrange [0:6]
set yrange [0:1.5]

set xtics 1
set ytics 0.2

$data << EOD
0 1 a_0    
1 0.5 a_1
2 0.25 a_2
3 0.125 a_3
4 0.0625 a_4
5 0.03125 a_5
EOD

plot \
  $data using 1:2 ls 3 lw 12 lc "#000000" title "Geometrische Folge: a_n = (1/2)^n", \
  $data using 1:2:3 with labels font ",24" offset 3,0.75 notitle;
