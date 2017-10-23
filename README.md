# btcgpu-build
Docker build container for bitcoin gold, aka BTCGPU, aka BGold... It's pretty tricky to get all your ducks in a row building bitcoin core, let alone, bgold, a new fork with lots of moving parts.

Use this image to bring up the latest (currently manually checked out as a submodule) bgold, prebuilt and ready to run.

I hope this gets new volunteers up to speed quicker. The Dockerfile captures some of the "oral tradition" of building bitcoin.

## How to use
First of all, check the Dockerfile to see exactly what imports and process is used.

Get the image first.

    docker pull oxide/btcgpu-docker 

Next, you can just jump right into bash with a ready built bgold for running tests or examining deps by:

    ./exec.sh

If you want to change the Dockerfile, you will have to run:

    ./build.sh
    
Note that this can rebuild all the dependencies from source, which can take quite some time...
