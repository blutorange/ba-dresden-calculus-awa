// @ts-check

const { spawnSync } = require("child_process");
const Crypto = require("crypto");
const fs = require("fs");
const os = require("os");
const path = require("path");

/**
 * @typedef {{
 *   mass: number,
 *   springConstant: number,
 *   deltaTime: number,
 *   startTime:  number,
 *   endTime: number,
 *   initialPosition: number,
 *   initialVelocity: number,
 * }} PendulumConfig
 */
undefined;

/**
 * @typedef {{
 *   position: number,
 *   velocity: number,
 *   time: number,
 * }} PendulumDataPoint
 */
undefined;

/**
 * @typedef {{time: Interval, position: Interval, velocity: Interval}} Bounds
 */
undefined;

/**
 * @typedef {{min: number, max: number}} Interval
 */
undefined;

/**
 * @param {PendulumConfig} config
 * @return {PendulumDataPoint[]}
 */
function simulatePendulum(config) {
  /** @type {PendulumDataPoint[]} */
  const result = [{
    position: config.initialPosition,
    velocity: config.initialVelocity,
    time: config.startTime,
  }];
  for (let t = config.startTime; t <= config.endTime; t += config.deltaTime) {
    const x = result[result.length - 1].position;
    const v = result[result.length - 1].velocity;
    const newX = x + config.deltaTime * v;
    const newV = v - config.deltaTime * config.springConstant / config.mass * x
    result.push({
      position: newX,
      velocity: newV,
      time: t + config.deltaTime,
    });
  }
  return result;
}

/**
 * @template T
 * @param {T[]} data
 * @param {(datum: T) => number} mapper
 * @return {Interval}
 */
function minMax(data, mapper) {
  /** @type {Interval} */
  const result = {max: mapper(data[0]), min: mapper(data[0])};
  for (const datum of data) {
    result.max = Math.max(mapper(datum), result.max);  
    result.min = Math.min(mapper(datum), result.min);  
  }
  return result;
}

/**
 * @param {PendulumDataPoint[]} dataPoints
 * @return {Bounds}
 */
function computeBounds(dataPoints) {
  return {
    position: minMax(dataPoints, p => p.position),
    time: minMax(dataPoints, p => p.time),
    velocity: minMax(dataPoints, p => p.velocity),
  };
}

/**
 * @param {PendulumDataPoint[]} dataPoints
 * @param timeInterval
 * @return {string[]}
 */
function printPendulumCurve(dataPoints, timeInterval) {
  /** @type {string[]} */
  const lines = [];
  /** @type {number | undefined} */
  let nextPrintTime = undefined;
  for (const dataPoint of dataPoints) {
    if (nextPrintTime == undefined) {
      lines.push(`${dataPoint.time} ${dataPoint.position} ${dataPoint.velocity}`);
      nextPrintTime = dataPoint.time + timeInterval;
    }
    if (dataPoint.time >= nextPrintTime) {
      lines.push(`${dataPoint.time} ${dataPoint.position} ${dataPoint.velocity}`);
      nextPrintTime = dataPoint.time + timeInterval;
    }
  }
  return lines;
}

function tmpFile(ext) {
  return path.join(os.tmpdir(), `archive.${Crypto.randomBytes(6).readUIntLE(0, 6).toString(36)}.${ext}`);
}

/**
 * @param {string} filename 
 * @param {string[]} data
 * @param {Bounds} bounds
 * @param {string} dataType
 * @return {string}
 */
function createGnuplotScript(filename, data, bounds, dataType) {
  const minX = Math.floor(bounds.time.min);
  const maxX = Math.floor(bounds.time.max);
  const minY = Math.floor(Math.min(bounds.position.min, bounds.velocity.min));
  const maxY = Math.ceil(Math.max(bounds.position.max, bounds.velocity.max));
  const xTics = (maxX-minX) / 5;
  const yTics = (maxY-minY) / 8;
  return `
  # Default for plotting a univariate function

  set encoding utf8
  set output "${filename}".".png"

  set key font ",24" opaque
  set tics font ",22" 

  set key above

  set grid
  set grid ls 1 lc "#000000" lw 2 dt (15,10)

  set xlabel font ",22" 
  set ylabel font ",22" 

  set zeroaxis ls 2 lw 3 lc "#000000"

  set xlabel "t/s"
  set ylabel "x / m | v / (m/s)"

  set terminal pngcairo dashed size 800,800

  $data << EOD
    ${data.join("\n")}
EOD

  set xrange [${minX}:${maxX}];
  set yrange [${minY}:${maxY}];

  set xtics ${xTics};
  set ytics ${yTics};

  plot \
    4*cos(x) lw 6 lc "#aa3333" title "Exakte Lösung", \
    $data u 1:2 lw 4 ps 3 pt 7 lc "#33aa33" w ${dataType} title "Ort", \
    $data u 1:3 lw 4 ps 3 pt 7 lc "#3333aa" w ${dataType} title "Geschwindigkeit"
`;
}

if (process.argv.length <= 2) {
  console.log("Simple spring simulation. Usage:");
  console.log(`${process.argv[0]} ${process.argv[1]} <OutputFilename> <DeltaTime> [lines|points|linespoints]` );
  process.exit();
}

const filename = process.argv[2] ?? "output";
const tempFile = tmpFile("gnuplot");
const deltaTime = parseFloat(process.argv[3] ?? "0.1");
const dataType = process.argv[4] ?? "linespoints";

const result = simulatePendulum({
  mass: 1,
  springConstant: 1,
  startTime: 0,
  endTime: 5,
  deltaTime: deltaTime,
  initialPosition: 4,
  initialVelocity: 0,
});
const data = printPendulumCurve(result, Math.max(deltaTime/2, 0.1));
const bounds = computeBounds(result);
const gnuplotScript = createGnuplotScript(filename, data, bounds, dataType);

fs.writeFileSync(tempFile, gnuplotScript, { encoding: "utf-8" });
spawnSync("gnuplot", [tempFile], {
  encoding: "utf8",
});
