A simple node JS program that parses a JavaScript program and creates an image with a visual representation of the parse tree via graphviz.

Usage:

Make sure you have installed [node](https://nodejs.org/en/) and [graphviz](https://graphviz.org/), and that these commands are available in your `PATH`. Then run

```bash
./render-graph.sh
```

Enter the code you wish to analyze, e.g. `const x = a*(b+c)` and press `Enter` followed by `Ctrl+D`. The script parses the code and creates the file `graph-rendered.png`.

On a Windows system, you can run the node and graphviz commands individually:

```
# Parse the JavaScript code and create a graphviz file
node graph-create.js "<FILE_NAME_WITH_CODE.js>"

# Render the graphviz file to an image
dot graph-data.txt -Tpng -o graph-rendered.png
```
