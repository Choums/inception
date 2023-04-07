#!/bin/bash

docker rm db
docker build . --file Dockerfile -t mari
docker run --name db mari
