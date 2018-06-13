# debian-9 based builder for the wire-desktop app

FROM debian:9

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        pkg-config \
        libtool \
        automake \
        build-essential \
        git \
        curl \
        gcc \
        g++ \
        make \
        alien \
        g++-multilib \
        libc6-dev

# xorriso workaround # https://github.com/electron-userland/electron-builder/issues/993
RUN apt-get install -y xorriso
ENV USE_SYSTEM_XORRISO=true

# nodejs, yarn
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn nodejs
