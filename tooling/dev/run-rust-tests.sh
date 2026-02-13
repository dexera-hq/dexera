#!/usr/bin/env bash
set -euo pipefail

if ! command -v cargo >/dev/null 2>&1; then
  echo "cargo not installed; skipping rust tests"
  exit 0
fi

if [ ! -f services/core/Cargo.toml ]; then
  echo "services/core/Cargo.toml not found; skipping rust tests"
  exit 0
fi

echo "==> cargo test --workspace (services/core)"
(
  cd services/core
  cargo test --workspace
)
