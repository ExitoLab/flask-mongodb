.PHONY: compose-up compose-build compose-down compose-restart compose-tail compose-top compose-ps

SHELL := /bin/bash -l

compose-up: compose-down compose-build ## Create and start containers
	docker-compose up -d

compose-down: ## Stop and remove containers, networks, images, and volumes
	docker-compose down --remove-orphans

compose-build: ## Build or rebuild services
	docker-compose build --no-cache

compose-restart: compose-up ## restart services

compose-tail: ## Tail output from containers
	docker-compose logs -f

compose-top: ## Display the running processes
	docker-compose top

compose-ps: ## List containers
	docker-compose ps