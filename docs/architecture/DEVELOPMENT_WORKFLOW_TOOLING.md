## Monorepo build system

pnpm workspaces power package management across JS/TS apps and libraries.
Turborepo orchestrates build, test, lint, typecheck, smoke, and dev tasks.

Default root tasks:

- `pnpm build`
- `pnpm lint`
- `pnpm typecheck`
- `pnpm test`
- `pnpm smoke`

Affected-only tasks:

- `pnpm build:changed`
- `pnpm lint:changed`
- `pnpm typecheck:changed`
- `pnpm test:changed`
- `pnpm check:changed`
- `pnpm smoke:changed`

Discovery/debug helpers:

- `pnpm affected:list`
- `pnpm tasks:dry`
- `pnpm graph:build`

## CI behavior

JS/TS CI uses affected-only Turborepo runs with remote cache enabled.
Required CI environment:

- `TURBO_TEAM`
- `TURBO_TOKEN`

`TURBO_SCM_BASE` is resolved in CI from PR base SHA (or push `before` SHA) so `--affected` compares against the correct commit.

## Local dev entrypoints

Main entrypoint:

- `make dev`

Focused JS/TS dev entrypoints:

- `make dev-web`
- `make dev-edge`
- `make dev-core-js`
