A simple node JS program that parses a JavaScript program and creates an image with a visual representation of the parse tree via graphviz.

Usage:

```bash
./render-graph.sh
```

Enter the code you wish to analyze, e.g. `const x = a*(b+c)` and press `Enter` followed by `Ctrl+D`. The script parses the code and creates the file `graph-rendered.png`.
