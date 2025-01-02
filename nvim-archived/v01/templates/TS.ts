import { createInterface } from "readline";

const readline = createInterface({
  input: process.stdin,
  output: process.stdout,
});

let currentLineNum = 0;
const maxLineNum = 2;

readline.on("line", (line: string) => {
  currentLineNum++;

  // Solution
  if (currentLineNum === maxLineNum) {
    readline.close();
  }
});
