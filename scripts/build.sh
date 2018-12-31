#!/bin/bash

# Build containers
ROOT_PATH=$(dirname $(dirname $0))

for DOCKER_FILES in $(ls -1 $ROOT_PATH/**/Dockerfile 2>/dev/null); do
    DOCKER_PATH=$(dirname $DOCKER_FILES)

    echo "Build: $DOCKER_PATH";
    docker build -q $DOCKER_PATH
done
