#!/bin/bash
docker rm try1
docker build . --file Dockerfile -t wp
docker run --name try1 -it wp sh
