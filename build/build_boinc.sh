#!/bin/bash

# Set the desired version
# This script assumes you specify the tar.gz version (not .zip)
RELEASE_VER="https://github.com/BOINC/boinc/archive/refs/tags/client_release/7.24/7.24.1.tar.gz"
cd /

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
    g++ \
    curl

# Download and extract the source tarball
curl -o /source.tgz -L $RELEASE_VER
tar -xzf /source.tgz

# Build
cd /boinc-client_release*
./_autosetup
./configure --disable-server --disable-manager --enable-client \
    CXXFLAGS="-O2 -pipe"
make

# Install
make install
cp -f /usr/local/bin/* /build
