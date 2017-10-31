#!/bin/bash

source .btcgpu-docker-env

docker run -it -v btcgpu-vol:/root/.bitcoingold -p $BG_PORT:$BG_PORT --rm ${BG_IMAGE}-dev 
    
