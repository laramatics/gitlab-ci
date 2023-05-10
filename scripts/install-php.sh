#!/usr/bin/env ash

# Installing Composer
install-php-extensions @composer-${COMPOSER_VERSION} imagick
# note: install-php-extensions installs are much easier than docker-php-ext-install

# Installing PHP Extensions
docker-php-ext-configure opcache --enable-opcache
docker-php-ext-configure zip --with-libzip
docker-php-ext-install -j "$(nproc)" \
  sockets \
  bz2 \
  bcmath \
  exif

docker-php-ext-install -j "$(nproc)" mysqli pdo pdo_mysql
docker-php-ext-install -j "$(nproc)" zip
install-php-extensions redis
install-php-extensions intl
install-php-extensions imap

docker-php-ext-configure pcntl --enable-pcntl &&
  docker-php-ext-install pcntl &&
  docker-php-ext-enable pcntl

docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp
# note: for some reason if we build gd with the rest of the extensions it will trow an error in php -v
docker-php-ext-install -j "$(nproc)" gd
