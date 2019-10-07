FROM alpine:3.8

RUN apk update \
  && apk upgrade \
  && apk add --no-cache \
             rsync \
             openssh-client \
             curl \
             zip \
             sshpass \
  && rm -rf /var/cache/apk/*
