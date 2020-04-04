#!/bin/bash

docker exec -it \
	postgres_docker \
	bash -c 'echo hello'
