#!/bin/bash

source .btcgpu-docker-env
docker run -v $BG_VOL:/root/.bitcoingold -p $BG_PORT:$BG_PORT -p $BG_RPC_PORT:$BG_RPC_PORT -d --rm --name $BG_CONTAINER $BG_IMAGE bgoldd --printtoconsole -addnode=109.201.133.93 --txindex $@
