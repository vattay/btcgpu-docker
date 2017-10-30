#!/bin/bash

source .btcgpu-docker-env
docker build -t $BG_IMAGE $@ .
