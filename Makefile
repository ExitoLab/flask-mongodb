.PHONY: all
all: start-docker-compose
docker-compose: start-docker-compose
docker-compose-down: docker-compose-down

SHELL := /bin/bash -l

start-docker-compose: docker-compose-down
	docker system prune -f && \
	docker-compose build && \
	docker-compose up -d

docker-compose-down: 
	docker-compose down