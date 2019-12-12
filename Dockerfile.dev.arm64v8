FROM alpine AS builder

# Download QEMU, see https://github.com/docker/hub-feedback/issues/1261
#ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v3.0.0%2Bresin/qemu-3.0.0+resin-aarch64.tar.gz
ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v4.0.0-balena/qemu-4.0.0-balena-aarch64.tar.gz
RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1


 FROM lsiobase/alpine:arm64v8-3.10

# Add QEMU
COPY --from=builder qemu-aarch64-static /usr/bin

ENV PUID=1000
ENV PGID=1000

RUN \
    apk update && \
    apk add --no-cache \
    nodejs \
    npm \
    yarn \
    wget \
    git \
    unzip \
    jq && \
    mkdir /deez && \
    chown abc:abc /deez && \
    rm -R /config && \
    ln -sf /deez/.config/Deezloader\ Remix/ /config && \
    ln -sf /downloads /deez/Deezloader\ Music

RUN \
    wget https://notabug.org/RemixDevs/DeezloaderRemix/archive/development.zip && \
    unzip development.zip && \
    rm development.zip

WORKDIR /deezloaderremix

RUN \
    yarn install && \
    yarn cache clean
  
EXPOSE 1731

COPY root/ /

VOLUME /downloads /config
