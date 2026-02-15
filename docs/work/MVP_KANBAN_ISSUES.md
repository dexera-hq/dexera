```
#1
Title: Define MVP perps scope and DoD
Description: Lock MVP scope to non-custodial perps on Hyperliquid and Aster with explicit out-of-scope items. Define measurable acceptance gates for product, engineering, and QA.
Labels: type::proposal, area::architecture, protocol::perps
Priority: Urgent
Size: S

---

#2
Title: Build MVP risk register and mitigations
Description: Capture launch risks including stale feeds, adapter outages, reject spikes, and reconciliation drift. Assign owners and measurable mitigation controls.
Labels: type::risk, area::threat-model, protocol::perps
Priority: High
Size: S

---

#3
Title: Finalize environment variable and secrets matrix
Description: Define required env vars and secrets by service and environment for local/dev/staging/prod. Ensure typed validation coverage for TS, Go, and Rust components.
Labels: type::chore, area::infra, protocol::perps
Priority: High
Size: M

---

#4
Title: Provision Postgres and Redis by environment tier
Description: Stand up Neon and Upstash resources per tier and verify service connectivity. Configure baseline backup, retention, and access controls for MVP.
Labels: type::ops, area::database, protocol::perps
Priority: High
Size: M

---

#5
Title: Define canonical perps domain models
Description: Standardize shared models for instruments, orders, fills, positions, leverage, funding, and liquidation context. Freeze precision and enum conventions for cross-service parity.
Labels: type::feature, area::backend-api, protocol::perps
Priority: Urgent
Size: M

---

#6
Title: Define versioned adapter contract interfaces
Description: Specify normalized adapter interfaces for market data, account state, and order entry. Include error taxonomy, retry semantics, and capability flags.
Labels: type::feature, area::dex-integration, protocol::perps
Priority: Urgent
Size: M

---

#7
Title: Implement market metadata ingestion and cache
Description: Ingest symbol metadata and trading constraints into a normalized cache layer. Expose low-latency reads for BFF and terminal consumers.
Labels: type::feature, area::data-pipelines, protocol::perps
Priority: High
Size: M

---

#8
Title: Implement Hyperliquid public market data adapter
Description: Integrate Hyperliquid book/trade/candle/mark streams into canonical contracts. Add heartbeat monitoring and reconnect gap recovery logic.
Labels: type::feature, area::dex-integration, protocol::perps, dex::hyperliquid
Priority: Urgent
Size: L

---

#9
Title: Implement Hyperliquid private account state adapter
Description: Integrate balances, open orders, fills, positions, and funding updates from private channels. Normalize event ordering and state transitions for downstream engines.
Labels: type::feature, area::dex-integration, protocol::perps, dex::hyperliquid
Priority: Urgent
Size: L

---

#10
Title: Implement Hyperliquid order entry adapter
Description: Support create/cancel/replace with deterministic client IDs and idempotency behavior. Map exchange rejects to canonical error codes.
Labels: type::feature, area::order-entry, protocol::perps, dex::hyperliquid
Priority: Urgent
Size: L

---

#11
Title: Add Hyperliquid pre-trade validation rules
Description: Validate tick/lot/min-notional/reduce-only/leverage constraints before placement. Return actionable errors consumable directly by terminal order ticket.
Labels: type::feature, area::price-routing, protocol::perps, dex::hyperliquid
Priority: High
Size: M

---

#12
Title: Implement Aster public market data adapter
Description: Integrate Aster order book and trade feeds into canonical market stream contracts. Add robust reconnect handling and stream health checks.
Labels: type::feature, area::dex-integration, protocol::perps, dex::aster
Priority: High
Size: L

---

#13
Title: Implement Aster private account state adapter
Description: Integrate Aster account, positions, and execution events into normalized internal state updates. Ensure parity with shared adapter contract behavior.
Labels: type::feature, area::dex-integration, protocol::perps, dex::aster
Priority: High
Size: L

---

#14
Title: Implement Aster order entry adapter
Description: Add create/cancel/replace flows with deterministic IDs and idempotent retries. Normalize throttle and rejection responses into shared error taxonomy.
Labels: type::feature, area::order-entry, protocol::perps, dex::aster
Priority: High
Size: L

---

#15
Title: Add Aster pre-trade validation rules
Description: Enforce Aster venue constraints before placement and preserve shared validation response format. Align UX-facing errors with Hyperliquid path.
Labels: type::feature, area::price-routing, protocol::perps, dex::aster
Priority: High
Size: M

---

#16
Title: Build unified position aggregation engine
Description: Merge venue-specific deltas into a canonical cross-venue positions view. Compute realized/unrealized PnL and effective leverage consistently.
Labels: type::feature, area::positions-pnl, protocol::perps
Priority: Urgent
Size: L

---

#17
Title: Implement funding and fee accrual computation
Description: Compute position-level funding and fee attribution with deterministic replayability. Persist aggregates for terminal display and reconciliation use.
Labels: type::feature, area::positions-pnl, protocol::perps
Priority: High
Size: M

---

#18
Title: Add reconciliation jobs for internal vs venue state
Description: Compare adapter snapshots against internal state on schedule and on demand. Emit drift alerts with repair runbook hooks.
Labels: type::ops, area::data-pipelines, protocol::perps
Priority: High
Size: M

---

#19
Title: Define GraphQL schema for perps MVP in BFF
Description: Publish normalized queries, subscriptions, and mutations for instruments, positions, order lifecycle, and account summaries. Version schema and lock MVP stability guarantees.
Labels: type::feature, area::backend-api, protocol::perps
Priority: Urgent
Size: L

---

#20
Title: Implement realtime fanout service channels
Description: Stream normalized market/account/position/order events with low-latency fanout semantics. Add backpressure controls and per-channel protections.
Labels: type::feature, area::alerts-notifications, protocol::perps
Priority: High
Size: M

---

#21
Title: Configure edge gateway cache and rate limiting
Description: Add Cloudflare Worker policies for read-mostly metadata and public endpoint caching. Implement rate limits to protect BFF and adapter backends.
Labels: type::ops, area::ci-cd, protocol::perps
Priority: High
Size: M

---

#22
Title: Implement wallet connect and trading session bootstrap
Description: Build wallet connection, account selection, and authenticated trading session initialization. Ensure clear handling of failed auth/session states.
Labels: type::feature, area::wallet-connection, protocol::perps
Priority: High
Size: M

---

#23
Title: Build Hyperliquid-first perps order ticket UI
Description: Ship market/limit ticket with reduce-only, leverage, and pre-trade validation output rendering. Optimize for fast keyboard-driven workflows.
Labels: type::feature, area::order-entry, protocol::perps, dex::hyperliquid
Priority: Urgent
Size: L

---

#24
Title: Build live positions and PnL terminal block
Description: Render live positions with margin usage, liquidation proximity, and realized/unrealized PnL. Support stable updates under high-frequency streams.
Labels: type::feature, area::positions-pnl, protocol::perps
Priority: High
Size: L

---

#25
Title: Build order book and trades terminal blocks
Description: Implement performant depth and tape visualization with precision-safe formatting. Add degraded-mode handling for stream gaps.
Labels: type::feature, area::charting, protocol::perps
Priority: High
Size: M

---

#26
Title: Extend order ticket for Aster venue routing
Description: Add Aster venue support to order ticket and a clear route selector with persistence. Maintain behavior parity with Hyperliquid controls.
Labels: type::feature, area::order-entry, protocol::perps, dex::aster
Priority: High
Size: M

---

#27
Title: Implement workspace layout persistence
Description: Persist terminal layouts and block preferences per user workspace in Postgres. Make schema migration-safe for future block expansion.
Labels: type::feature, area::layout-workspace, protocol::perps
Priority: Medium
Size: M

---

#28
Title: Implement position risk alerts and webhook ingress
Description: Add alert rules for margin ratio, liquidation distance, and abrupt PnL shifts. Route alerts through webhook ingress and in-app notification channels.
Labels: type::feature, area::alerts-notifications, protocol::perps
Priority: Medium
Size: M

---

#29
Title: Instrument observability baseline across services
Description: Add structured logs, traces, and metrics for adapters, BFF, realtime, and positions services. Provide SLO-oriented dashboards and alert thresholds.
Labels: type::ops, area::observability, protocol::perps
Priority: Urgent
Size: M

---

#30
Title: Write incident runbooks for exchange and feed failures
Description: Document operational playbooks for outages, stale data, reject spikes, and reconciliation drift. Include escalation flow and rollback procedures.
Labels: type::docs, area::customer-support, protocol::perps
Priority: High
Size: S

---

#31
Title: Audit signing boundaries and session security
Description: Validate non-custodial assumptions, auth/session boundaries, and unsigned payload handling. Produce remediation tasks for critical findings.
Labels: type::audit, area::security, protocol::perps
Priority: High
Size: M

---

#32
Title: Produce threat model for perps data/control paths
Description: Model threats across market ingestion, account streams, order entry, and notification surfaces. Rank mitigations by exploitability and impact.
Labels: type::risk, area::threat-model, protocol::perps
Priority: High
Size: M

---

#33
Title: Define performance budgets and load scenarios
Description: Set p95/p99 targets for render latency, order ack latency, and position freshness. Define replayable load profiles for Hyperliquid and Aster streams.
Labels: type::proposal, area::performance, protocol::perps
Priority: High
Size: S

---

#34
Title: Implement Hyperliquid integration test suite
Description: Cover market normalization, account sync, order lifecycle, and reconnect recovery in integration tests. Gate merges on deterministic pass criteria.
Labels: type::qa, area::dex-integration, testing::integration, protocol::perps, dex::hyperliquid
Priority: Urgent
Size: L

---

#35
Title: Implement Aster integration test suite
Description: Mirror Hyperliquid coverage for Aster market/account/order paths and recovery behavior. Enforce contract parity across venues.
Labels: type::qa, area::dex-integration, testing::integration, protocol::perps, dex::aster
Priority: High
Size: L

---

#36
Title: Implement end-to-end terminal trading scenarios
Description: Add E2E tests for wallet connect, subscription startup, order placement/cancel, and positions updates. Use deterministic fixtures for CI stability.
Labels: type::qa, area::terminal-ui, testing::e2e, protocol::perps
Priority: High
Size: L

---

#37
Title: Build regression harness for PnL and funding math
Description: Add deterministic replay tests for edge-case precision and liquidation-adjacent calculations. Protect against silent regressions during adapter changes.
Labels: type::qa, area::positions-pnl, testing::regression, protocol::perps
Priority: High
Size: M

---

#38
Title: Execute staging readiness checklist and signoff
Description: Run functional, reliability, security, and runbook checks in staging against explicit go/no-go criteria. Record owner signoffs per area.
Labels: type::release, area::architecture, protocol::perps
Priority: Urgent
Size: S

---

#39
Title: Prepare MVP launch runbook and 72-hour monitoring plan
Description: Define rollout sequence, rollback triggers, and first-72-hour incident cadence. Lock post-launch success metrics and review checkpoints.
Labels: type::release, area::observability, protocol::perps
Priority: Urgent
Size: S
```
