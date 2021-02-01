#!/usr/bin/env ash
apk --update --no-cache

RUN apk add --no-cache --virtual .build-deps  \
  zlib-dev \
  libjpeg-turbo-dev \
  libpng-dev \
  libxml2-dev \
  bzip2-dev