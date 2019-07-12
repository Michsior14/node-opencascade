#!/bin/bash

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

for tag in $(docker images michaukrieg/node-opencascade --format "{{.Tag}}");
do
    docker push "michaukrieg/node-opencascade:${tag}"
done