#!/bin/bash
# $1	=>	'Build' or 'Stop'
# $2	=>	image
# $3	=>	name

if [ ! "$#" -eq 3 ]; then
	echo "Not enough Arguments"
	exit 1;
fi

if [ "$1" == 'Build' ]; then
	docker build . --file Dockerfile -t "$2"
	echo "Build successful\n"

	docker run --name "$3" -p 443:443 -d -it "$2"
	echo "Run done\n"

	docker exec -it "$3" /bin/sh
elif [ "$1" == 'Stop' ]; then
	docker stop "$3"
	docker rm -f "$3"
	docker rmi -f "$2"
else
	echo "Command missing: 'Build' or 'Stop'\n"
fi