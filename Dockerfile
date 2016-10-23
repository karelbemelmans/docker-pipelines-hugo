FROM alpine:3.4
MAINTAINER Karel Bemelmans <mail@karelbemelmans.com>

# Install bash, we need this to run this container for Pipelines
RUN apk add --update bash

# Install aws-cli
RUN apk add --update python py-pip \
  && pip install -U awscli

# Install hugo.
# Code taken from this project: https://github.com/jojomi/docker-hugo
ENV HUGO_VERSION=0.17
RUN apk add --update wget ca-certificates && \
  cd /tmp/ && \
  wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
  tar xzf hugo_${HUGO_VERSION}_linux-64bit.tgz && \
  rm -r hugo_${HUGO_VERSION}_linux-64bit.tgz && \
  mv hugo /usr/bin/hugo && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*
