# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-alpine:3.22 AS builder

COPY root/ /

RUN \
  apk add --no-cache \
    bash \
    bzip2 \
    coreutils \
    git \
    gzip \
    imagemagick \
    librsvg \
    pngquant \
    rsvg-convert \
    tar \
    util-linux && \
  mkdir -p \
    /picons \
    /usr/src/temp-output && \
  rm -rf /tmp/* && \
  git clone https://github.com/picons/picons /usr/src/picons-source && \
  cp /backgrounds.conf /usr/src/picons-source/build-input/ && \
  cd /usr/src/picons-source && \
  ./2-build-picons.sh snp-full && \
  tar xf \
    /usr/src/picons-source/build-output/binaries-snp-full/*hardlink*.tar.xz -C \
    /usr/src/temp-output --strip-components=1 && \
  tar -cjf /picons/picons.tar.bz2 -C /usr/src/temp-output . && \
  chmod -R 777 /picons

FROM scratch

LABEL org.opencontainers.image.source="https://github.com/linuxserver/picons-builder"

COPY --from=builder /picons/picons.tar.bz2 /picons.tar.bz2
