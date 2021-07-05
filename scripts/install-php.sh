#!/usr/bin/env ash

# Installing Composer
install-php-extensions @composer-${COMPOSER_VERSION}

# Installing PHP Extensions
docker-php-ext-configure opcache --enable-opcache &&
  docker-php-ext-configure gd --enable-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ --with-webp-dir=/usr/include/ &&
  docker-php-ext-configure zip &&
  docker-php-ext-install -j "$(nproc)" \
    mysqli \
    pdo_mysql \
    sockets \
    intl \
    bz2 \
    pcntl \
    bcmath \
    exif

# note: for some reason if we build gd with the rest of the extensions it will trow an error in php -v
docker-php-ext-install -j "$(nproc)" gd
