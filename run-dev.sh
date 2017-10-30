#!/bin/bash

source .btcgpu-docker-env
docker run -it -v btcgpu-vol:/root/.bitcoingold -p 18338:18338 --rm ${BG_IMAGE}-dev 
    
