#!/bin/bash

#docker exec -it \
#	postgres_docker \
#	bash -c '/queries/query_runner_p1.sh /queries'

#./mk_addr_sccs.sh

docker exec -it \
	postgres_docker \
	bash -c '/queries/query_runner_p2.sh /queries'
