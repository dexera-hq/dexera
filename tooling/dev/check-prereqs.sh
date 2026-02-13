#!/usr/bin/env bash
set -euo pipefail

missing=0

for cmd in node pnpm; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "missing required command: $cmd"
    missing=1
  fi
done

for optional in go cargo; do
  if ! command -v "$optional" >/dev/null 2>&1; then
    echo "optional command not found: $optional (some checks will be skipped)"
  fi
done

if [ "$missing" -ne 0 ]; then
  exit 1
fi

echo "prerequisite check passed"
