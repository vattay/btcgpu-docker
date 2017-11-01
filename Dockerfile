FROM ubuntu:16.04 as builder
# Bitcoin gold build environment

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
    libfontconfig-dev \
    vim

WORKDIR /tmp/
COPY BTCGPU/depends/ /tmp/btcgpu/depends
WORKDIR /tmp/btcgpu/depends
RUN make

WORKDIR /root/BTCGPU-docker
COPY . ./
WORKDIR /root/BTCGPU-docker/BTCGPU
RUN ./autogen.sh && ./configure \
    --prefix=/tmp/btcgpu/depends/x86_64-pc-linux-gnu/ \
    --disable-shared \
    --without-gui \
    && make -j$(nproc)

CMD ["/bin/bash", "-l"]


FROM builder as tester
# Test checkpoint
RUN make check
CMD ["/bin/bash", "-l"]


FROM ubuntu:16.04 as runner
# Slim run container.

WORKDIR /opt/BTCGPU
COPY --from=tester /root/BTCGPU-docker/BTCGPU/src/bgoldd /usr/bin/bgoldd
COPY --from=tester /root/BTCGPU-docker/BTCGPU/src/bgold-cli /usr/bin/bgold-cli
COPY --from=tester /root/BTCGPU-docker/BTCGPU/src/bitcoin-tx /usr/bin/bitcoing-tx

VOLUME ["/root/.bitcoingold"]

CMD ["bgoldd", "--printtoconsole", "--testnet"] 
