FROM alpine:latest
MAINTAINER Darron Froese <darron@froese.org>

ENV HUGO_VERSION=0.20.2
ENV CADDY_VERSION=0.10.0

RUN apk add --update wget ca-certificates && \
  cd /tmp/ && \
  wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
  tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
  mv hugo_${HUGO_VERSION}_linux_amd64/hugo_${HUGO_VERSION}_linux_amd64 /usr/bin/hugo && \
  rm -rf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz  hugo_${HUGO_VERSION}_linux_amd64 && \
  wget https://github.com/mholt/caddy/releases/download/v${CADDY_VERSION}/caddy_v${CADDY_VERSION}_linux_amd64.tar.gz && \
  tar xzvf caddy_v${CADDY_VERSION}_linux_amd64.tar.gz && \
  mv caddy /usr/bin/caddy && \
  rm -rf init/ CHANGES.txt LICENSE.txt README.txt && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*
