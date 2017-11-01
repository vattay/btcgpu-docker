#!/bin/bash

source .btcgpu-docker-env

docker run -it -v btcgpu-vol:/root/.bitcoingold --rm ${BG_IMAGE}-dev 
    
