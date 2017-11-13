# btcgpu-build
Docker container for BTCGPU / Bitcoin Gold mainnet full node.
See the testnet branch for a similar testnet full node.

## Requirements
Docker
At least 160GB of free disk space.

## How to use
### Turbo Mode
Clone this repo and enter  directory

    git clone https://github.com/vattay/btcgpu-docker.git
    cd btcgpu-docker

Run the bitcoin gold full node in a detached container in the background.

    ./run.sh

You can then play with this node on bash with something like:

    ./exec.sh
    bgold-cli getinfo

It should also be available via RPC on port 8332.

### Dev and Test Mode
You can get the huge full build environment if you want to compile, test, or debug.

    docker pull oxide/btcgpu-docker:testnet-dev

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
