import js from "@eslint/js";
import tsParser from "@typescript-eslint/parser";
import tsPlugin from "@typescript-eslint/eslint-plugin";
import globals from "globals";

const ignores = [
  "**/node_modules/**",
  "**/dist/**",
  "**/build/**",
  "**/.next/**",
  "**/.turbo/**",
  "**/coverage/**"
];

export function createTypeScriptConfig(options = {}) {
  const runtime = options.runtime ?? "node";
  const runtimeGlobals =
    runtime === "worker"
      ? { ...globals.node, ...globals.serviceworker }
      : { ...globals.node };

  return [
    {
      ignores
    },
    js.configs.recommended,
    {
      files: ["**/*.js", "**/*.mjs", "**/*.cjs"],
      languageOptions: {
        ecmaVersion: "latest",
        sourceType: "module",
        globals: runtimeGlobals
      }
    },
    {
      files: ["**/*.ts", "**/*.tsx", "**/*.mts", "**/*.cts"],
      languageOptions: {
        parser: tsParser,
        parserOptions: {
          ecmaVersion: "latest",
          sourceType: "module"
        },
        globals: runtimeGlobals
      },
      plugins: {
        "@typescript-eslint": tsPlugin
      },
      rules: {
        ...tsPlugin.configs.recommended.rules,
        "no-unused-vars": "off",
        "@typescript-eslint/no-unused-vars": [
          "error",
          {
            argsIgnorePattern: "^_",
            varsIgnorePattern: "^_"
          }
        ],
        "@typescript-eslint/consistent-type-imports": [
          "error",
          {
            prefer: "type-imports",
            fixStyle: "separate-type-imports"
          }
        ]
      }
    }
  ];
}

export default createTypeScriptConfig();
