import { createInterface } from "readline";

const lineReader = createInterface({
  input: process.stdin,
  output: process.stdout,
  rlfDelay: Infinity,
});

let lineNumber = 0;

lineReader.on("line", function (line) {
  lineNumber++;
  console.log(`${lineNumber}. ${line}`);
});

lineReader.on("close", function () {});
