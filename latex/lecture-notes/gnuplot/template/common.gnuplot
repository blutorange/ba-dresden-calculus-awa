set encoding utf8
set output filename.".png"

output='call "template/set-output.gnuplot"'
terminal='call "template/set-terminal.gnuplot"'
gplot='call "template/plot-gradient.gnuplot"'
gplotmono='call "template/plot-gradient-mono.gnuplot"'
