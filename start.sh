#!/bin/sh

echo '# build images && run docker-compose'

echo '######################## docker stop container ########################'
docker stop $(docker ps -aq)

echo '######################## docker removed container ########################'
docker rm $(docker ps -aq)

echo '######################## docker build container ########################'
docker-compose -f docker-compose.yml down
docker-compose -f docker-compose.yml build --force-rm --compress --no-cache
docker-compose -f docker-compose.yml up --build