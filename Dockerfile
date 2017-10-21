FROM ubuntu:16.04
# Bitcoin gold build environment

# Base
#RUN apt-get update && apt-get install -y \
#    git \
#    software-properties-common \
#    build-essential \
#    libtool \
#    autotools-dev \
#    automake \
#    pkg-config \
#    libssl-dev \
#    libevent-dev \
#    bsdmainutils \
#    python3 \
#    libboost-all-dev \
#    libsodium-dev \
#    libsodium18 \
#    libminiupnpc-dev \
#    libzmq3-dev
#
# Berkley DB portability support    
#RUN add-apt-repository -y ppa:bitcoin/bitcoin \
#    && apt-get update && apt-get install -y \
#    libdb4.8-dev \
#    libdb4.8++-dev 

# For UPNP
#RUN apt-get update && apt-get install -y \
#    libminiupnpc-dev

#RUN apt-get update && apt-get install -y \
#    libzmq3-dev

# For QT5 GUI
#RUN apt-get update && apt-get install -y \
#    libqt5gui5 \
#    libqt5core5a \
#    libqt5dbus5 \
#    qttools5-dev \
#    qttools5-dev-tools \
#    libprotobuf-dev \
#    protobuf-compiler

# For libqrencode
#RUN apt-get update && apt-get install -y \
#    libqrencode-dev

WORKDIR /root

RUN git clone https://github.com/BTCGPU/BTCGPU.git \
    && cd BTCGPU

RUN cd depends \
    && make

CMD ["/bin/bash"]
