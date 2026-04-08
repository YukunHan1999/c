FROM ubuntu:latest

RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \ 
    sed -i 's/security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \ 
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bash \
    build-essential \
    curl \
    gdb \
    git \
    libglib2.0-dev \
    libfdt-dev \
    libpixman-1-dev \
    locales \
    make \
    ninja-build \
    pkg-config \
    strace \
    vim-nox \
    wget \
    zlib1g-dev \
    man-db 

RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# 安装 vim-plug 插件管理器
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 添加基础 vim 配置
RUN echo 'syntax on\n\
set number\n\
set tabstop=4\n\
set shiftwidth=4\n\
set expandtab\n\
set autoindent\n\
set hlsearch\n\
set ignorecase\n\
set smartcase\n\
\n\
call plug#begin("~/.vim/plugged")\n\
Plug "preservim/nerdtree"\n\
Plug "vim-airline/vim-airline"\n\
Plug "neoclide/coc.nvim", {"branch": "release"}\n\
Plug "tpope/vim-fugitive"\n\
Plug "tpope/vim-commentary"\n\
call plug#end()\n' >> ~/.vimrc

WORKDIR /mnt
