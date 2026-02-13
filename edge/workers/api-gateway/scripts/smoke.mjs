import fs from "node:fs";
if (!fs.existsSync(new URL("../src/index.ts", import.meta.url))) {
  throw new Error("missing worker entrypoint");
}
console.log("worker smoke passed");
