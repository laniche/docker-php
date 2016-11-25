#!/bin/bash

# Prepare variables from partials files
for DOCKER_CONF in $(ls -1 conf/* 2>/dev/null); do
    CONF_NAME=$(basename $DOCKER_CONF | tr '[:lower:]' '[:upper:]')

    echo "Load: ${CONF_NAME}"
    declare -a "$CONF_NAME=$(cat $DOCKER_CONF)"
done

# Build dockerfiles
for DOCKER_SKEL in $(ls -1 **/*.skel 2>/dev/null); do 
    DOCKER_PATH=$(dirname $DOCKER_SKEL)

    echo "Build: $DOCKER_PATH"; 
    eval "echo \"$(cat $DOCKER_SKEL)\"" > $DOCKER_PATH/Dockerfile
done


