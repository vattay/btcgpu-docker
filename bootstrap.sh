#!/bin/bash

source .btcgpu-docker-env
docker run -v $BG_VOL:/root/.bitcoingold -p $BG_PORT:$BG_PORT -p $BG_RPC_PORT:$BG_RPC_PORT -d --rm --name $BG_CONTAINER $BG_IMAGE bgoldd -bootstrap -printtoconsole -addnode=83.240.121.5:8333 -addnode=147.229.209.176:8333 -addnode=147.251.255.192:8333 -addnode=89.177.56.173:8333 -addnode=77.93.223.9:8333 -addnode=81.2.246.127:8333 -addnode=90.178.156.102:8333
