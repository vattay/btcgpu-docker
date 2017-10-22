FROM ubuntu:16.04
# Bitcoin gold build environment

ENV THREADS 8

# Base
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    libtool \
    autotools-dev \
    automake \
    pkg-config \
    bsdmainutils \
    python3 \
    libx11-xcb-dev \
    libfontconfig-dev 

WORKDIR /root/
ADD BTCGPU ./BTCGPU
WORKDIR /root/BTCGPU/depends
RUN make -j $THREADS
WORKDIR /root/BTCGPU
RUN ./autogen.sh \
    && ./configure --prefix=/root/BTCGPU/depends/x86_64-pc-linux-gnu/ \
    && make -j $THREADS

CMD ["/bin/bash"]
