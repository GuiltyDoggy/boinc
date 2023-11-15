FROM ubuntu:latest

LABEL maintainer="Yosuke Matsumura" \
      description="A premade environment that can build the boinc client."

#Install
RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install -y git \
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


# Cleaning up
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*
