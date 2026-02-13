#!/usr/bin/env bash
set -euo pipefail

if command -v pnpm >/dev/null 2>&1; then
  echo "==> pnpm turbo run smoke"
  pnpm turbo run smoke
else
  echo "pnpm not installed; skipping js/ts smoke"
fi

./tooling/dev/run-go-tests.sh
./tooling/dev/run-rust-tests.sh

echo "smoke checks completed"
