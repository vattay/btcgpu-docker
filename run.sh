#!/bin/bash

source .btcgpu-docker-env
docker run -v btcgpu-vol:/root/.bitcoingold -p 18338:18338 --rm -d $BG_IMAGE 
    
