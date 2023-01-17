#!/usr/bin/env ash

# Installing Composer
install-php-extensions @composer-${COMPOSER_VERSION} imagick
# note: install-php-extensions installs are much easier than docker-php-ext-install

# Installing PHP Extensions
docker-php-ext-configure opcache --enable-opcache
docker-php-ext-configure zip --with-libzip
docker-php-ext-configure imap --with-imap --with-imap-ssl
docker-php-ext-install -j "$(nproc)" \
  sockets \
  bz2 \
  pcntl \
  bcmath \
  exif \
  imap

docker-php-ext-install -j "$(nproc)" mysqli pdo pdo_mysql
docker-php-ext-install -j "$(nproc)" zip
install-php-extensions redis
install-php-extensions intl

docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp
# note: for some reason if we build gd with the rest of the extensions it will trow an error in php -v
docker-php-ext-install -j "$(nproc)" gd
