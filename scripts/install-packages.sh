#!/usr/bin/env ash
RUN apk --update add --no-cache --virtual .build-deps  \
  zlib-dev \
  libjpeg-turbo-dev \
  libpng-dev \
  libxml2-dev \
  bzip2-dev