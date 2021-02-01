#!/usr/bin/env ash
apk --update add --no-cache --virtual .build-deps \
  gnupg \
  zlib-dev \
  libjpeg-turbo-dev \
  libpng-dev \
  libxml2-dev \
  bzip2-dev \
  libzip-dev

# Add Production Dependencies
apk add --update --no-cache \
  freetype-dev \
  mysql-client \
  libwebp-dev \
  icu-dev

# Installing PHP Security Checker
PHP_SC_VERSION=$(curl --silent "https://api.github.com/repos/fabpot/local-php-security-checker/releases/latest" |
  grep '"tag_name":' |
  sed -E 's/.*"([^"]+)".*/\1/;s/^v//')
curl -sS https://github.com/fabpot/local-php-security-checker/releases/download/v${PHP_SC_VERSION}/local-php-security-checker_${PHP_SC_VERSION}_linux_amd64 >/usr/local/bin/local-php-security-checker
chmod +x /usr/local/bin/local-php-security-checker
unset PHP_SC_VERSION
