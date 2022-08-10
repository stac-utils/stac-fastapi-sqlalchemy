#!make
APP_HOST ?= 0.0.0.0
APP_PORT ?= 8080
EXTERNAL_APP_PORT ?= ${APP_PORT}
run_container = docker-compose run --rm \
				-p ${EXTERNAL_APP_PORT}:${APP_PORT} \
				-e APP_HOST=${APP_HOST} \
				-e APP_PORT=${APP_PORT} \
				stac-fastapi

.PHONY: image
image:
	docker-compose build

.PHONY: docker-run-all
docker-run-all:
	docker-compose up

.PHONY: docker-run
docker-run: image
	$(run_container)

.PHONY: docker-shell
docker-shell:
	$(run_container) /bin/bash


.PHONY: test
test: run-joplin
	$(run_container) /bin/bash -c 'export && ./scripts/wait-for-it.sh database:5432 && pytest -vvv'


.PHONY: run-database
run-database:
	docker-compose run --rm database

.PHONY: run-joplin
run-joplin:
	docker-compose run --rm load-joplin

.PHONY: docs-image
docs-image:
	docker-compose -f docker-compose.docs.yml \
		build

.PHONY: docs
docs: docs-image
	docker-compose -f docker-compose.docs.yml \
		run docs
