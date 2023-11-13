#!/bin/bash

# Install pre-req packages
apt update
apt upgrade -y
apt install -y git \
    python3 \
    make \
    m4 \
    pkg-config \
    dh-autoreconf \
    libcurl4-openssl-dev \
    libssl-dev \
    zlib1g-dev \
    g++

# Clone the source code repo
git clone https://github.com/BOINC/boinc /boinc
cd /boinc
git clean -f -d -x

# Check out desired version
git checkout client_release/7.24/7.24.1

# Build
./_autosetup
./configure --disable-server --disable-manager --enable-client \
    CXXFLAGS="-O3 "
make

# Install
cd client
cp boinc /build