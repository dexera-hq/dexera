import fs from "node:fs";

const required = ["app/page.tsx", "app/layout.tsx", "src/env.ts"];
for (const file of required) {
  if (!fs.existsSync(new URL(`../${file}`, import.meta.url))) {
    throw new Error(`missing required file: ${file}`);
  }
}
console.log("@dexera/web smoke passed");
