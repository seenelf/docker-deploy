FROM alpine:3.8

RUN apk update \
  && apk upgrade \
  && apk add --no-cache \
             rsync \
             openssh-client \
             curl \
             zip \
             sshpass \
	     git \
  && rm -rf /var/cache/apk/*

RUN mkdir -p ~/.ssh/ && touch ~/.ssh/config && echo "StrictHostKeyChecking no" >> ~/.ssh/config
