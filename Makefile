SHELL := /bin/bash

.PHONY: bootstrap dev build lint test typecheck smoke go-test rust-test

bootstrap:
	@./tooling/dev/check-prereqs.sh
	@pnpm install --no-frozen-lockfile

dev:
	@./tooling/dev/dev.sh

build:
	@pnpm build

lint:
	@pnpm lint

test:
	@pnpm test

typecheck:
	@pnpm typecheck

go-test:
	@./tooling/dev/run-go-tests.sh

rust-test:
	@./tooling/dev/run-rust-tests.sh

smoke:
	@./tooling/dev/smoke.sh
