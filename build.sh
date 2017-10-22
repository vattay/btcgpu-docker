#!/bin/bash

source .btcgpu-docker-env
docker build -t $BTCGPU_DOCKER_IMAGE .
