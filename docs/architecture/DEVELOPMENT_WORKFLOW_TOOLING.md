```
## Monorepo build system
pnpm workspaces for JS/TS packages + apps.
Turborepo orchestrates builds/tests across TS + Go + Rust via task wrappers.

Example tasks: lint, test, build, typecheck, dev, docker:build.

## Local dev entrypoints
make dev (or just dev) runs:
apps/web dev server
edge/workers in wrangler dev
services/bff locally
Postgres/Redis connect to dev Neon/Upstash

## Coding standards
TS: eslint + prettier + typecheck
Go: golangci-lint
Rust: rustfmt + clippy
```
