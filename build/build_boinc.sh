#!/bin/bash

# Specify the source tarball (get from BOINC github releases)
# This script assumes you specify the tar.gz version (not .zip)
RELEASE_VER="https://github.com/BOINC/boinc/archive/refs/tags/client_release/7.24/7.24.1.tar.gz"
cd /


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


# Download and extract the source tarball
curl -o /source.tgz -L $RELEASE_VER
tar -xzf /source.tgz


# Build
cd /boinc-client_release*
./_autosetup
./configure --disable-server --disable-manager \
    CXXFLAGS="-O3"
make


# Install
make install
cp --update=all /usr/local/bin/* /build
