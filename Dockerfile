FROM debian:jessie-slim

LABEL maintainer="Yannick Foeillet <bzhtux@gmail.com>"

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    curl \
    git \
    g++ \
    make \
    libssl-dev

RUN curl -L https://github.com/AGWA/git-crypt/archive/debian/0.6.0-1.tar.gz -o /tmp/git-crypt.tar.gz \
    && tar xvf /tmp/git-crypt.tar.gz -C /tmp/ \
    && cd /tmp/git-crypt-debian-0.6.0-1 \
    && make \
    && make install PREFIX=/usr/local

RUN curl -L https://github.com/git-lfs/git-lfs/releases/download/v2.6.1/git-lfs-linux-amd64-v2.6.1.tar.gz -o /tmp/git-lfs.tar.gz \
    && tar xvf /tmp/git-lfs.tar.gz -C /tmp/ \
    && chmod +x /tmp/git-lfs \
    && mv /tmp/git-lfs /usr/local/bin

