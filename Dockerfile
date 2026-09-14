FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /workdir

RUN set -eux; \
    rm -f /etc/apt/sources.list.d/ubuntu.sources; \
    { \
      echo 'deb [arch=amd64] http://archive.ubuntu.com/ubuntu noble main restricted universe multiverse'; \
      echo 'deb [arch=amd64] http://archive.ubuntu.com/ubuntu noble-updates main restricted universe multiverse'; \
      echo 'deb [arch=amd64] http://security.ubuntu.com/ubuntu noble-security main restricted universe multiverse'; \
      echo 'deb [arch=armhf,arm64] http://ports.ubuntu.com/ubuntu-ports noble main restricted universe multiverse'; \
      echo 'deb [arch=armhf,arm64] http://ports.ubuntu.com/ubuntu-ports noble-updates main restricted universe multiverse'; \
      echo 'deb [arch=armhf,arm64] http://ports.ubuntu.com/ubuntu-ports noble-security main restricted universe multiverse'; \
    } > /etc/apt/sources.list; \
    dpkg --add-architecture armhf; \
    dpkg --add-architecture arm64; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      ca-certificates \
      build-essential \
      g++ \
      g++-arm-linux-gnueabihf \
      g++-aarch64-linux-gnu \
      clang \
      lld \
      pkg-config \
      file \
      make \
      libavformat-dev:amd64 \
      libavcodec-dev:amd64 \
      libavutil-dev:amd64 \
      libswresample-dev:amd64 \
      libavformat-dev:armhf \
      libavcodec-dev:armhf \
      libavutil-dev:armhf \
      libswresample-dev:armhf \
      libavformat-dev:arm64 \
      libavcodec-dev:arm64 \
      libavutil-dev:arm64 \
      libswresample-dev:arm64; \
    rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    ln -sf /usr/bin/ld.lld /usr/bin/arm-linux-gnueabihf-ld.lld; \
    ln -sf /usr/bin/ld.lld /usr/bin/aarch64-linux-gnu-ld.lld

CMD ["bash"]
