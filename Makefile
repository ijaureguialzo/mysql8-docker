#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo ------------------------
	@echo start / stop / restart
	@echo ------------------------
	@echo stats / logs / workspace
	@echo clean
	@echo ------------------------

_header:
	@echo ---------------
	@echo MySQL en Docker
	@echo ---------------

_urls: _header
	${info }
	@echo -----------------------------------
	@echo [phpMyAdmin] https://localhost:8080
	@echo -----------------------------------

_start-command:
	@docker compose up -d --remove-orphans

start: _start-command _urls

stop:
	@docker compose stop

restart: stop start

stats:
	@docker stats

logs:
	@docker compose logs mysql

workspace:
	@docker compose exec mysql /bin/bash

clean:
	@docker compose down -v --remove-orphans
