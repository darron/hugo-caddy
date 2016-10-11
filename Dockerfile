FROM alpine:latest
MAINTAINER Darron Froese <darron@froese.org>

ENV HUGO_VERSION=0.17
ENV CADDY_VERSION=0.9.3

RUN apk add --update wget ca-certificates && \
  cd /tmp/ && \
  wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
  tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
  mv hugo_0.17_linux_amd64/hugo_0.17_linux_amd64 /usr/bin/hugo && \
  rm -rf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz  hugo_0.17_linux_amd64 && \
  wget https://github.com/mholt/caddy/releases/download/v${CADDY_VERSION}/caddy_linux_amd64.tar.gz && \
  tar xzf caddy_linux_amd64.tar.gz && \
  mv caddy_linux_amd64 /usr/bin/caddy && \
  rm -rf init/ CHANGES.txt LICENSE.txt README.txt && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*