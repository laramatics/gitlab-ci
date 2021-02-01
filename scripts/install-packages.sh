#!/usr/bin/env ash
apk --update add --no-cache --virtual .build-deps \
  zlib-dev \
  libjpeg-turbo-dev \
  libpng-dev \
  libxml2-dev \
  bzip2-dev

# Add Production Dependencies
apk add --update --no-cache \
  freetype-dev \
  mysql-client
