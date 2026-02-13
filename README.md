# dexera

Dexera is a polyglot monorepo for trading UI, edge services, backend services, and shared packages.

## Quickstart

```bash
make bootstrap
make smoke
```

## Top-level structure

- `apps/`: Next.js UI and docs app
- `edge/workers/`: Cloudflare Worker edge services
- `services/`: Go, Rust, and TS backend services
- `packages/`: Shared TS packages and configuration
- `infra/`: Terraform, Cloudflare, Fly.io, and Kubernetes scaffolding
- `configs/env/`: root environment templates
- `tooling/`: local dev and CI helpers
