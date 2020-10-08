load "template/data-plot.gnuplot"

set xlabel "Index n"
set ylabel "Folgenglied a_n"

set xrange [0:6]
set yrange [0:14]

set xtics 1
set ytics 1

$data << EOD
0 1 a_0    
1 3 a_1
2 5 a_2
3 7 a_3
4 9 a_4
5 11 a_5
EOD

plot \
  $data using 1:2 ls 3 lw 12 lc "#000000" title "Arithmetische Folge: a_n = 2n+1", \
  $data using 1:2:3 with labels font ",22" offset 3,-0.75 notitle;
