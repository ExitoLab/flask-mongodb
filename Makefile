.PHONY: compose-up compose-build compose-down compose-restart compose-tail compose-top compose-ps #docker-compose
.PHONY: install-api uninstall-app 

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

install-nginx-controller: install-nginx-controller ## Install nginx controller
	@echo 'Installing nginx controller using helmcharts'
	helm repo add bitnami https://charts.bitnami.com/bitnami && \
	helm upgrade --install nginx-ingress-controller bitnami/nginx-ingress-controller
	sleep 30s

install-mongodb: ## install  mongodb
	@echo 'Installing mongodb using helmcharts'
	helm repo add bitnami https://charts.bitnami.com/bitnami && \
	helm upgrade --install --wait --timeout 120s --atomic mongodb bitnami/mongodb -f k8-mongodb/values.yaml
	
install-app: install-nginx-controller install-mongodb ## install rest-api
	@echo 'Installing the rest-api'
	helm upgrade --install --wait --timeout 120s --atomic flask-api ./k8-helm-manifest -f k8-helm-manifest/values.yaml

delete-mongodb: ## upgrade  mongodb
	@echo 'Deleting mongodb using helmcharts'
	helm repo add bitnami https://charts.bitnami.com/bitnami && \
	helm delete mongodb

delete-app: delete-mongodb ## upgrade rest-api
	@echo 'Deleting the rest-api'
	helm delete flask-api

delete-nginx-controller: ## Delete nginx controller
	@echo 'Deleting nginx controller using helmcharts'
	helm delete nginx-ingress-controller

install-api: install-app ## install the application

uninstall-app: delete-nginx-controller delete-app ## uninstall the application

install-nginx-controller: install-nginx-controller