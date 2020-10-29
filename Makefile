M = $(shell printf "\033[34;1m▶\033[0m")

.PHONY: help
help: ## Prints this help message
	@grep -E '^[a-zA-Z_-]+:.*## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: start_local_swarm
start_local_swarm: ## Starts a local swarm instance of the UI
	$(info $(M) Starts a local swarm instance)
	
ifndef REGISTRY_DOMAIN
	$(error REGISTRY_DOMAIN is not set !(Use "REGISTRY_DOMAIN=..."  before the build command) )
endif
ifndef LOCAL_DOMAIN
	$(error LOCAL_DOMAIN is not set !(Use "LOCAL_DOMAIN=..."  before the build command) )
endif

	$(info $(M) Docker registry used : ${REGISTRY_DOMAIN})
	$(info $(M) UI url : ${LOCAL_DOMAIN})

	docker stack rm registryui_local
	docker stack deploy -c docker/swarm/docker-compose.yml -c docker/swarm/docker-compose-override.yml registryui_local

	echo "==>Add to the /etc/hosts file :"
	echo -e "\t 127.0.0.1 ${LOCAL_DOMAIN}"

.PHONY: stop_local_swarm
stop_local_swarm: ## Stops the local swarm instance of the UI
	$(info $(M) Stops the local swarm instance of the UI)

	@docker stack rm registryui_local

.DEFAULT_GOAL := help