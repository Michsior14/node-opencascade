#!/bin/bash

BUILD_TAG="michaukrieg/node-opencascade:${OCCT_VERSION}-node${NODE_VERSION}"

set -x
docker build . \
    --no-cache \
    -t "$BUILD_TAG" \
    --build-arg node_version=$NODE_VERSION \
    --build-arg occt_version=$OCCT_VERSION

docker run --rm --entrypoint echo "$BUILD_TAG" "Hello world!"