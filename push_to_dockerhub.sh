#!/bin/bash

# Source environment variables for password
source .env

IMAGE="$(podman build -q -t boinc-client:amd -f Containerfile.amd-custom)"
podman login -u guiltydoggy -p $DOCKERPASS docker.io/guiltydoggy
podman push $IMAGE docker.io/guiltydoggy/boinc-client:amd
