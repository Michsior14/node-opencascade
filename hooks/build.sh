#!/bin/bash

TAG="${OCCT_VERSION}-node${NODE_VERSION}"
BUILD_TAG="michaukrieg/node-opencascade:${TAG}"

set -x
docker build . \
    --no-cache \
    -t "$BUILD_TAG" \
    --build-arg node_version=$NODE_VERSION \
    --build-arg occt_version=$OCCT_VERSION

image_id=$(docker images $BUILD_TAG --format "{{.ID}}")
docker tag $image_id "michaukrieg/node-opencascade:${TAG}"
docker run --rm --entrypoint echo "$TAG" "Hello world!"