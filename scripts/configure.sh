#!/bin/bash

# Prepare variables from partials files
for DOCKER_CONF in $(ls -1 conf/* 2>/dev/null); do
    CONF_NAME=$(basename $DOCKER_CONF | tr '[:lower:]' '[:upper:]')

    echo -e "\033[1;34mLoad config:\033[0m ${CONF_NAME}"
    declare -a "$CONF_NAME=$(cat $DOCKER_CONF)"
done

# Create dockerfiles
for DOCKER_SKEL in $(ls -1 **/*.skel 2>/dev/null); do
    DOCKER_PATH=$(dirname $DOCKER_SKEL)

    echo -e "\033[1;34mCreate Dockerfile:\033[0m $DOCKER_PATH";
    eval "echo \"$(cat $DOCKER_SKEL)\"" > $DOCKER_PATH/Dockerfile
done

# Manually copy Docker file for "Prod" versions
cp php7-apache/Dockerfile php7-apache-prod/
cp php73-apache/Dockerfile php73-apache-prod/
