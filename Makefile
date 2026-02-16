SHELL := /bin/bash

.PHONY: bootstrap dev dev-web dev-edge dev-core-js build build-changed lint lint-changed test test-changed typecheck typecheck-changed check-changed smoke smoke-changed go-test rust-test tasks-dry graph-build

bootstrap:
	@./tooling/dev/check-prereqs.sh
	@pnpm install --no-frozen-lockfile

dev:
	@./tooling/dev/dev.sh

dev-web:
	@pnpm dev:web

dev-edge:
	@pnpm dev:edge

dev-core-js:
	@pnpm dev:core-js

build:
	@pnpm build

build-changed:
	@pnpm build:changed

lint:
	@pnpm lint

lint-changed:
	@pnpm lint:changed

test:
	@pnpm test

test-changed:
	@pnpm test:changed

typecheck:
	@pnpm typecheck

typecheck-changed:
	@pnpm typecheck:changed

check-changed:
	@pnpm check:changed

go-test:
	@./tooling/dev/run-go-tests.sh

rust-test:
	@./tooling/dev/run-rust-tests.sh

smoke:
	@./tooling/dev/smoke.sh

smoke-changed:
	@pnpm smoke:changed

tasks-dry:
	@pnpm tasks:dry

graph-build:
	@pnpm graph:build
