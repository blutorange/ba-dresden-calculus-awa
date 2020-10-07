function f(x) {
  return Math.sin(2*x);
}
function main(x) {
  const y = f(x+2);
  console.log(`Answer is ${y}`);
}

1+2

main(parseFloat(process.argv[2]));
