#!/bin/bash

source .btcgpu-docker-env
docker run -it --rm \
    -p 18338:18338 \
    -v btcgpu-vol:/root/.bitcoingold $BG_IMAGE
