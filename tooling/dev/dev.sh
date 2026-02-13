#!/usr/bin/env bash
set -euo pipefail

pids=()

cleanup() {
  for pid in "${pids[@]:-}"; do
    if kill -0 "$pid" >/dev/null 2>&1; then
      kill "$pid" >/dev/null 2>&1 || true
    fi
  done
}
trap cleanup EXIT INT TERM

echo "==> starting JS/TS dev processes via pnpm"
pnpm dev &
pids+=("$!")

if command -v go >/dev/null 2>&1; then
  echo "==> starting services/bff"
  (
    cd services/bff
    go run ./cmd/bff
  ) &
  pids+=("$!")
else
  echo "go not installed; skipping services/bff dev process"
fi

wait -n "${pids[@]}"
