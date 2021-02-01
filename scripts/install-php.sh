#!/usr/bin/env ash

# Installing Composer
install-php-extensions @composer

# Installing PHP Extensions
docker-php-ext-configure opcache --enable-opcache &&
  docker-php-ext-configure gd --with-jpeg=/usr/include/ --with-freetype=/usr/include/ &&
  docker-php-ext-configure zip &&
  docker-php-ext-install -j "$(nproc)" \
    gmp \
    opcache \
    imagick \
    mysqli \
    pdo \
    pdo_mysql \
    sockets \
    json \
    intl \
    gd \
    xml \
    bz2 \
    pcntl \
    bcmath

