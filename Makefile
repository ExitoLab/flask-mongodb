.PHONY: compose-up compose-build compose-down compose-restart compose-tail compose-top compose-ps #docker-compose
.PHONY: install-api upgrade-app uninstall-app 

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

install-nginx-controller:  ## Install nginx controller
	@echo 'Installing nginx controlle using helmcharts'
	helm repo add bitnami https://charts.bitnami.com/bitnami && \
	helm install nginx-ingress-controller bitnami/nginx-ingress-controller

install-mongodb: ## install  mongodb
	@echo 'Installing mongodb using helmcharts'
	helm repo add bitnami https://charts.bitnami.com/bitnami && \
	helm install mongodb bitnami/mongodb -f k8-mongodb/values.yaml
	@echo 'wait for 60s for the database to come up'
	sleep 60s

install-app: install-mongodb ## install rest-api
	@echo 'Installing the rest-api'
	helm install flask-api ./k8-helm-manifest -f k8-helm-manifest/values.yaml

upgrade-mongodb: ## upgrade  mongodb
	@echo 'Upgrading mongodb using helmcharts'
	helm repo add bitnami https://charts.bitnami.com/bitnami && \
	helm upgrade mongodb bitnami/mongodb -f k8-mongodb/values.yaml
	@echo 'wait for 60s for the database to come up'
	sleep 60s

upgrade-app: upgrade-mongodb ## upgrade rest-api
	@echo 'Upgrading the rest-api'
	helm upgrade flask-api ./k8-helm-manifest -f k8-helm-manifest/values.yaml

delete-mongodb: ## upgrade  mongodb
	@echo 'Deleting mongodb using helmcharts'
	helm repo add bitnami https://charts.bitnami.com/bitnami && \
	helm delete mongodb

delete-app: delete-mongodb ## upgrade rest-api
	@echo 'Deleting the rest-api'
	helm delete flask-api

install-api: install-app ## install the application

upgrade-api: upgrade-app ## upgrade the application

uninstall-app: delete-app ## uninstall the applicationhelm delete api ./k8-helm-manifest -f k8-helm-manifest/values.yaml