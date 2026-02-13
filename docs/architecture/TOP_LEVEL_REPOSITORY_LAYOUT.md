```
dexera/
  apps/
    web/                         # Next.js trading terminal UI
    docs/                        # docs site (Docusaurus)
  edge/
    workers/                     # Cloudflare Workers: edge gateway, public REST auth-less caching
      api-gateway/               # routing, rate limit, cache, thin endpoints
      webhook-ingress/           # alerts/webhooks intake (no custody)
  services/
    bff/                         # API/BFF (Go): GraphQL + WebSockets, orchestration
    realtime/                    # WS/SSE fanout (Go)
    core/                        # Rust core services/libs (adapters, sim, tx building helpers)
      adapters/                  # protocol & DEX adapters (versioned)
      simulation/                # pre-trade simulation/risk heuristics (no signing)
      tx-builder/                # unsigned tx payload builders / intent encoding
    indexer/                     # Ponder indexer (TypeScript) derived state + reorg strategy
    positions/                   # position engine
  packages/
    ui/                          # shared design system components
    shared/                      # shared TS types, schemas, constants
    block-runtime/               # block/plugin runtime contracts + sandbox interfaces
    block-kit/                   # terminal blocks (positions, chart, orders, watchlist, ...)
    sdk/                         # Dexera client SDK (typed API client, ws client, helpers)
    config/                      # shared lint/tsconfig/eslint/prettier/tailwind configs
  infra/
    terraform/                   # IaC (Cloudflare, Fly.io, Neon/Supabase, Upstash, secrets refs)
    cloudflare/                  # wrangler configs, Pages/Workers bindings
    fly/                         # fly.toml, release configs for services
    k8s/                         # manifests/helm
  tooling/
    ci/                          # reusable CI scripts/actions
    dev/                         # local dev helpers (certs, fixtures, docker compose)
  scripts/
    bootstrap/                   # one-time bootstrap scripts
    db/                          # migrations, seeds, reset scripts
    release/                     # versioning, changelog, tagging
  configs/
    env/                         # env templates + documentation
  docs/
    architecture/                # ADRs, diagrams, conventions
    runbooks/                    # oncall-ish runbooks
  .github/
    workflows/                   # CI/CD pipelines
    CODEOWNERS
  docker/                        # Dockerfiles per service
  Makefile or justfile
  turbo.json
  pnpm-workspace.yaml
```
