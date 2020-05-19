#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd ${script_dir}

network=kvp_net1

# start postgres
docker run -d \
	--name kong-database \
	--network=$network \
	-e "POSTGRES_USER=kong" \
	-e "POSTGRES_DB=kong" \
	-e "POSTGRES_PASSWORD=kong" \
	postgres:9.6

sleep 6

# bootstrap database
docker run --rm \
	--network=$network \
	-e "KONG_DATABASE=postgres" \
	-e "KONG_PG_HOST=kong-database" \
	-e "KONG_PG_PASSWORD=kong" \
	kong:latest kong migrations bootstrap

# start kong
# run it as service in swarm mode so that traefik sees it
docker stack deploy -c kong.yml kong
