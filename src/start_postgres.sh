#!/bin/sh

command -v docker >/dev/null 2>&1 || { echo >&2 "Either docker is not installed or is not in PATH. Exiting..."; exit 1; }

group="$(id -nG ${USER} | grep -c docker)"

if [ $group -eq 1 ]
then
	{ echo >&2 "User ${USER} is a member of group docker, continuing..."; }
else
	{ echo >&2 "User ${USER} is not a member of group docker, either add ${USER} to docker or use root user. Exiting..."; exit 1; }
fi

image="$(docker images | grep -c postgres_naman)"

if [ $image -eq 1 ]
then
	{ echo >&2 "Image postgres_naman exists, continuing..."; }
else
	docker build -t postgres_naman .
fi

docker run --rm \
	--name postgres_docker \
	-e POSTGRES_PASSWORD=passwd \
	-v ${PWD}/queries:/queries \
	-v ${PWD}/dataset:/dataset \
	postgres_naman
