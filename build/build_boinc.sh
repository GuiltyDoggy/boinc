#!/bin/bash

# Set the desired version
RELEASE_VER="client_release/7.24/7.24.1"

# Install pre-req packages
dnf upgrade -y
dnf install -y git \
    libtool \
    gcc-c++ \
    dh-autoreconf \
    sqlite \
    sqlite-devel \
    libnotify-devel \
    openssl-devel \
    wxGTK \
    wxGTK-devel \
    libcurl-devel \
    freeglut-devel \
    libXmu-devel

# Clone the source code repo
git clone https://github.com/BOINC/boinc /boinc
cd /boinc
git clean -f -d -x

# Check out desired version
git checkout $RELEASE_VER

# Build
./_autosetup
./configure --disable-server --disable-manager \
    CXXFLAGS="-O3"
make

# Install
make install
cp --update=all /usr/local/bin/* /build
