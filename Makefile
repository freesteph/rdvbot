DOCKER-RUN = docker compose run -e TERM --rm --entrypoint=""
BUNDLE-EXEC = bundle exec

build:
	docker compose build

up:
	docker compose up

down:
	docker compose down

sh:
	$(DOCKER-RUN) rdvbot $(BUNDLE-EXEC) bash

guard:
	$(DOCKER-RUN) rdvbot $(BUNDLE-EXEC) guard

lint:
	$(DOCKER-RUN) rdvbot $(BUNDLE-EXEC) rubocop
