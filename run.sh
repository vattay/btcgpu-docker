#!/bin/bash

source .btcgpu-docker-env
docker run -v btcgpu-testnet-vol:/root/.bitcoingold -p $BG_PORT:$BG_PORT -d --rm $BG_IMAGE bgoldd --printtoconsole --testnet $@
    
