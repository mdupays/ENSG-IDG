# Set default no argument goal to help
.DEFAULT_GOAL := help

# Ensure that errors don't hide inside pipes
SHELL         = /bin/bash
.SHELLFLAGS   = -o pipefail -c

# Variables initialization from .env file
DC_PROJECT?=$(shell cat .env | grep COMPOSE_PROJECT_NAME | sed 's/^*=//')
APP_URL?=$(shell cat .env | grep VIRTUAL_HOST | sed 's/.*=//')
CURRENT_DIR?= $(shell pwd)

# Every command is a PHONY, to avoid file naming confliction -> strengh comes from good habits!
.PHONY: help
help:
    @echo "=============================================================================================="
    @echo "                Building a simple Bubble Apps proxy composition "
    @echo "             https://github.com/elasticlabs/elabs-bubble-apps-proxy"
    @echo " "
    @echo "Hints for developers:"
    @echo "  make up             # With working HTTPS proxy, bring up the Bubble stack"
    @echo "  make down           # Brings the Bubble stack down. "
    @echo "  make update         # Update the whole stack"
    @echo "  make cleanup   # Complete hard cleanup of images, containers, networks, volumes & data"
    @echo "=============================================================================================="

build:
	docker compose -f docker-compose.yml build

update:
	docker compose -f docker-compose.yml pull

up:
	docker compose up -d --remove-orphans

down:
	docker compose down

cleanup:
    docker compose -f docker-compose.yml down --remove-orphans
    docker system prune -a