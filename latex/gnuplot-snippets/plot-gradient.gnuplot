scaling=ARG1
plot '++' u ($1-vx($1,$2)/2.0):($2-vy($1,$2)/2.0):\
    (vx($1,$2)):(vy($1,$2)):(vnorm($1,$2)) \
    with vectors head size ARG2,ARG3,ARG4 lw ARG5 lc palette title ARG6
