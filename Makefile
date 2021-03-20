.PHONY: help

help: ## this help output
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

docker-build: ## build the docker image
	docker-compose build blueprint

docker-run: ## run the docker image
	docker-compose up

go-build: ## build the go app
	go build -o tmp/blueprint ./cmd/blueprint/main.go

go-install: ## install the dependencies
	go install ./cmd/blueprint/main.go

go-run: ## run the go app
	go run ./cmd/blueprint/main.go

go-test: ## execute tests
	go test ./cmd/blueprint/... -cover
