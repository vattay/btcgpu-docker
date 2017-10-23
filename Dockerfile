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
    libfontconfig-dev 

WORKDIR /root/
ADD BTCGPU ./BTCGPU
WORKDIR /root/BTCGPU/depends
RUN make 
WORKDIR /root/BTCGPU
RUN ./autogen.sh \
    && ./configure --prefix=/root/BTCGPU/depends/x86_64-pc-linux-gnu/ --disable-shared \
    && make -j 4

RUN make check

FROM ubuntu:16.04
WORKDIR /opt/BTCGPU
COPY --from=builder /root/BTCGPU/src/bgoldd /usr/bin/bgoldd
COPY --from=builder /root/BTCGPU/src/bgold-cli /usr/bin/bgold-cli
COPY --from=builder /root/BTCGPU/src/bitcoin-tx /usr/bin/bitcoing-tx

CMD ["/bin/bash"]
