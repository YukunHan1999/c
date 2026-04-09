FROM ubuntu:latest

RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \ 
    sed -i 's/security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \ 
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bash \
    build-essential \
    curl \
    clangd-20 \
    gdb \
    git \
    libglib2.0-dev \
    libfdt-dev \
    libpixman-1-dev \
    locales \
    make \
    ninja-build \
    nodejs \
    npm \
    pkg-config \
    strace \
    tree \
    wget \
    zlib1g-dev \
    man-db \
    manpages-dev

RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV ALL_PROXY=http://172.17.0.1:7890

WORKDIR /home/ubuntu