#!/usr/bin/env ash
apk --update add --no-cache --virtual .build-deps \
  gnupg \
  zlib-dev \
  libjpeg-turbo-dev \
  libpng-dev \
  libxml2-dev \
  bzip2-dev \
  libzip-dev \
  zip

# Add Production Dependencies
apk add --update --no-cache \
  openssh \
  git \
  sed \
  freetype-dev \
  mysql-client \
  libwebp-dev \
  icu-dev

# Installing PHP Security Checker
PHP_SC_VERSION=$(curl -s "https://api.github.com/repos/fabpot/local-php-security-checker/releases/latest" |
  grep '"tag_name":' |
  sed -E 's/.*"([^"]+)".*/\1/;s/^v//')
curl -LSs https://github.com/fabpot/local-php-security-checker/releases/download/v${PHP_SC_VERSION}/local-php-security-checker_${PHP_SC_VERSION}_linux_amd64 >/usr/local/bin/local-php-security-checker
chmod +x /usr/local/bin/local-php-security-checker
unset PHP_SC_VERSION

# Installing Docker Registry (https://github.com/genuinetools/reg)
REG_VERSION=$(curl -s "https://api.github.com/repos/genuinetools/reg/releases/latest" |
  grep '"tag_name":' |
  sed -E 's/.*"([^"]+)".*/\1/;s/^v//')
export REG_SHA256="ade837fc5224acd8c34732bf54a94f579b47851cc6a7fd5899a98386b782e228"
curl -fSL "https://github.com/genuinetools/reg/releases/download/v${REG_VERSION}/reg-linux-amd64" -o "/usr/local/bin/reg" &&
  echo "${REG_SHA256}  /usr/local/bin/reg" | sha256sum -c - &&
  chmod a+x "/usr/local/bin/reg"
unset REG_SHA256 REG_VERSION
