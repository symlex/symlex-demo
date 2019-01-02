#!/usr/bin/env bash

if [[ -z $DOCKER_PASSWORD ]] || [[ -z $DOCKER_USERNAME ]]; then
    echo "DOCKER_PASSWORD and DOCKER_USERNAME not set in your environment";
    exit 1
fi

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin