.PHONY: help

help: ## this help output
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

run: ## run the go app
	go run ./cmd/blueprint/main.go

test: ## execute tests
	go test ./cmd/blueprint/... -cover
