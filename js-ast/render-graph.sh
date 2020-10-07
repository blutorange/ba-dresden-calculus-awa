#/usr/bin/bash

script="$1"

if [ -z $1 ] 
then
  echo "Enter code (one or more lines) and press [Enter] followed by [Ctrl+D] when done"
  script=$(</dev/stdin)
fi

node graph-create.js "$script"

dot graph-data.txt -Tpng -o graph-rendered.png

echo "Tree written to graph-rendered.png"
