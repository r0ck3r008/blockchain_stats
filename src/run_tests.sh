#!/bin/bash

docker exec -it \
	postgres_docker \
	bash -c '/queries/query_runner.sh'
