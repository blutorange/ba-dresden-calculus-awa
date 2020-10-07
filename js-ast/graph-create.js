const fs = require("fs");
const parser = require("@babel/parser");
const t = require("@babel/types");
const traverse = require("@babel/traverse").default;
const generate = require("@babel/generator").default;

if (process.argv.findIndex(x => x === "-h" || x === "--help") >= 0 || !process.argv[2]) {
  console.log(`Usage: node '${process.argv[1]}' <file-or-code>`);
  console.log(`For exapmple:`);
  console.log(`  node '${process.argv[1]}' script.js`);
  console.log(`  node '${process.argv[1]}' 'const y = 2 + Math.sin(3)'`);
  console.log("Output is written to ./graph-data.txt"); 
  process.exit(0);
}

if (fs.existsSync(process.argv[2])) {
  script = fs.readFileSync(process.argv[2] || "script.js", {encoding: "utf-8"});
}
else {
  script = process.argv[2];
}

function findColor(path) {
  if (path.isProgram()) return "palegreen1";
  if (path.isExpressionStatement()) return "lightblue1";
  if (path.isStatement()) return "lightblue2";
  if (path.isExpression()) return "seashell1";
  return "lightyellow";
}

function findShape(path) {
  if (path.isProgram()) return "box";
  if (path.isStatement()) return "diamond";
  return "ellipse";
}

function findLabel(path) {
  if (path.isProgram()) return " ";
  let more = "";
  if (path.isUnaryExpression()) {
    if (path.node.operator === "+") return "Positive +";
    if (path.node.operator === "-") return "Negation -";
  }
  if (path.isBinaryExpression() || path.isUnaryExpression()) {
    if (path.node.operator === "+") return "Sum +";
    if (path.node.operator === "-") return "Difference -";
    if (path.node.operator === "/") return "Quotient /";
    if (path.node.operator === "*") return "Product *";
    if (path.node.operator === "**") return "Power ^";
    more = path.node.operator;
  }
  if (path.isCallExpression() && path.node.callee.type === "Identifier") {
     if (path.node.callee.name === "diff") return "d/dx";
     if (path.node.callee.name === "int") return "∫";
     if (path.node.callee.name === "lim") return "lim";
     if (path.node.callee.name === "log") return "log";
     if (path.node.callee.name === "ln") return "ln";
     if (path.node.callee.name === "sin") return "sin";
     if (path.node.callee.name === "cos") return "cos";
     if (path.node.callee.name === "tan") return "tan";
  }
  if (more) {
    return `${path.type} [${more}]`;
  }
  else {
    return path.type;
  }
}

function findSubtext(path) {
    if (path.isProgram()) return " ";
    if (path.isFunctionDeclaration()) return " ";
    if (path.isFunctionExpression()) return " ";
    if (path.isBlockStatement()) return " ";
    try {
       let code = generate(path.node).code;
       code = code.length > 50 ? code.substr(0,50) + "..." : code;
       return code || "none";
    }
    catch (e) {
       return "none";
    }
}

function escape(text) {
    text = text.replace(/["'<>&\[\]]/g, char => `&#${char.codePointAt(0)};`);
    text = text.replace(/\n/g,"<BR />");
    return text;
}

function skipNode(path) {
  if (path.isIdentifier() && path.parentKey === "callee") return true;
  return false;
}

const ast = parser.parse(script);
const state = {id: 0, vertices: [], edges: []};
traverse(ast, {
  enter(path, state) {
    state.id += 1;
    if (skipNode(path)) return;

    path.setData("index", state.id);
    state.vertices.push(`

N${state.id} [shape=${findShape(path)},style=filled,color=${findColor(path)},label=<
  <FONT POINT-SIZE="16"><B>${escape(path.parentKey)}</B></FONT><BR />
  <FONT POINT-SIZE="16">${escape(findLabel(path))}</FONT><BR />
  <FONT POINT-SIZE="14" COLOR="darkgreen"><B>${escape(findSubtext(path))}</B></FONT>>
]
`);
    if (path.parentPath) {
      const parentId = path.parentPath.getData("index");
      if (parentId) {
        state.edges.push(`N${parentId} -> N${state.id};`);
      }
    }
  }
}, undefined, state);

const graphviz = `
digraph Script {
  ${state.vertices.join("\n  ")}

  ${state.edges.join("\n  ")}
}
`;

fs.writeFileSync("./graph-data.txt", graphviz, {encoding: "utf-8"});

