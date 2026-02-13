```
Frontend (apps/web)
Next.js (App Router) + React + TypeScript
State: TanStack Query (server state), Zustand (UI hot-path).
Charts: TradingView Lightweight Charts for candles; optional custom canvas/WebGL for depth.
Workers (browser): PnL aggregations, timeseries transforms, route comparisons.
Wallet: wagmi + viem, WalletConnect v2, EIP-1193, Permit2 readiness, ERC-4337 readiness.

Edge (edge/workers)
Cloudflare Workers: edge routing, caching (token lists, quote cache), rate limiting, simple public endpoints. Can proxy to BFF and core services, can also serve read-mostly metadata fast.

Backend services (services/*)
BFF (Go): GraphQL + WebSockets + REST for public endpoints (as per stack summary).
Core (Rust): DEX adapters, simulation, intent/tx building helpers (returns unsigned tx payloads).
Indexer (Ponder, TS): on-chain ingestion → derived state (positions, exposures, realized/unrealized PnL) with reorg strategy.

Data stores (infra binding)
OLTP Postgres: workspaces/layouts/block configs/watchlists/alerts.
Redis (Upstash): token metadata, quote cache, rate limits.
RPC Provider (Alchemy) initially.
OLAP ClickHouse: explicitly deferred, kept as an infra placeholder.
```