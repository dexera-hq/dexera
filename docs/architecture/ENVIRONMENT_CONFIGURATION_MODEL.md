```
local: developer machine
dev: shared dev environment (auto-deploy from main)
staging: production-like smoke environment (manual promote)
prod

##  Repo-wide configuration conventions
configs/env/
.env.example (root) documenting all variables (no secrets)
apps/web/.env.example, services/bff/.env.example, etc. for app-specific vars

Use typed config per component:
TS: zod schema validation (web, workers, ponder)
Go: envconfig/viper + validation
Rust: config + serde + validation

## Platform-specific env handling
Cloudflare Pages (apps/web):
Preview deployments per PR, Production on prod.
Env vars set in Pages dashboard per environment.

Cloudflare Workers (edge/workers):
wrangler.toml with [env.dev], [env.staging], [env.prod]
bindings: KV/Cache (optional), rate limit, upstream URLs.

Fly.io (services + indexer):
fly.toml per service with distinct apps: dexera-bff-dev, dexera-bff-prod, etc.
secrets set via fly secrets set in CI (scoped per app).

Neon (Postgres):
one project per tier.

Upstash (Redis):
one DB per tier.
```