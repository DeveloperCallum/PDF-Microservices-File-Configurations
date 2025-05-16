#!/bin/bash
set -e

parts/build-maven.sh
parts/build-docker.sh
echo "Finished building!"

cd ../Microservice-Arch
docker-compose down
docker-compose up --build