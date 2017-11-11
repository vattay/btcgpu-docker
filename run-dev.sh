#!/bin/bash

source .btcgpu-docker-env

docker run -it -v $BG_VOL:/root/.bitcoingold --rm ${BG_IMAGE}-dev 
