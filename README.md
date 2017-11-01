# btcgpu-build
Docker build, test, and run containers for Bitcoin Gold aka BTCGPU.

WIP: Testnet is not up yet, you can only run local "regtests"

Note that the chain and wallet will be presisted to a docker volume called "btcgpu-vol.

## How to use
### Turbo Mode
Pull the slim image

    docker pull oxide/btcgpu-docker:testnet

Run the bitcon gold node in a detached container in the background.

    ./run.sh
    
You can then play with this node on bash with something like:

    docker exec -it <container_id> /bin/bash -l
    bgold-cli -regtest generate 101
    bgold-cli -regtest getbalance

### Dev and Test Mode
You can get the huge full build environment if you want to compile, test, or debug.

    docker pull oxide/btcgpu-docker:master-regtest-dev
    
Then you could do something like run tests. This will drop you into bash in the container, in the bitcoin gold source directory.

    ./run-dev.sh
    make check
    
### Building
Note that this can rebuild all the dependencies from source, which can take quite some time...

To build the development image with all the build and test dependencies

    ./build-dev.sh
    
To build the slim run image

    ./build.sh
    
If this image was useful and hopefully profitable for you, please consider donating, I am not part of Bitcoin Gold core dev team or the premine, just an enthusiast.

Bitcoin: 1GXyfqegNFWGmXddrxN1bsK2XfsrRjnPWq
