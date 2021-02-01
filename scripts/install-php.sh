#!/usr/bin/env ash

# Installing Composer
install-php-extensions @composer

# Installing PHP Extensions
docker-php-ext-configure opcache --enable-opcache &&
  docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp &&
  docker-php-ext-configure zip &&
  docker-php-ext-install -j "$(nproc)" \
    mysqli \
    pdo_mysql \
    sockets \
    intl \
    bz2 \
    pcntl \
    bcmath

docker-php-ext-install -j "$(nproc)" gd
