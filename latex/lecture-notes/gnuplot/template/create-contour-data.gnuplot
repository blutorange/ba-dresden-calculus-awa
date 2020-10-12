# creates the data for a contour field
# uses node, so you must give a node expression, e.g. Math.sqrt(x*x+y*y)

#script = "node -e 'l=[];for(x=%f;x<=%f;x+=%f)for(y=%f;y<=%f;y+=%f)l.push(\`${x} ${y} ${%s}\`);require(\"fs\").writeFileSync(\"contour-data.dat\",l.join(\"\\n\"))'"

#if (exists("ARG2") && ARG2 ne "") {
#  steps = ARG2+0;
#}
# if (!exists("ARG2") || ARG2 eq "") {
#  steps = 200.0;
# }

# system(sprintf(script,xmin,xmax,(xmax-xmin)/steps,ymin,ymax,(ymax-ymin)/steps,ARG1))

set table 'contour-data.dat'
splot f(x,y)
unset table
