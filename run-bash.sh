#!/bin/bash

source .btcgpu-docker-env
docker run -it -v btcgpu-testnet-vol:/root/.bitcoingold --name $BG_CONTAINER -p $BG_PORT:$BG_PORT -p $BG_RPC_PORT:$BG_RPC_PORT --rm $BG_IMAGE /bin/bash -l
