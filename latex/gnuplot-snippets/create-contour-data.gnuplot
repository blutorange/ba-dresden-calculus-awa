# creates the data for a contour field
# uses node, so you must give a node expression, e.g. Math.sqrt(x*x+y*y)

set table 'contour-data.dat'
splot f(x,y)
unset table
