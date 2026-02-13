#!/usr/bin/env bash
set -euo pipefail

if ! command -v go >/dev/null 2>&1; then
  echo "go not installed; skipping go tests"
  exit 0
fi

while IFS= read -r modfile; do
  moddir="$(dirname "$modfile")"
  echo "==> go test $moddir"
  (
    cd "$moddir"
    go test ./...
  )
done < <(find services -name go.mod | sort)
