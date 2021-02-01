ARG NODE_VERSION=15
ARG NPM_VERSION=7.5.0
ARG PHP_VERSION=8.0.1
ARG COMPOSER_VERSION=2
FROM mhart/alpine-node:${NODE_VERSION} AS alpine-node
FROM php:${PHP_VERSION}-alpine
LABEL maintainer="Pezhvak <pezhvak@imvx.org>"
ENV INSTALL_NPM_VERSION $NPM_VERSION
ENV INSTALL_COMPOSER_VERSION $COMPOSER_VERSION

# Copy PHP Extension Installer (https://github.com/mlocati/docker-php-extension-installer)
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

# Copy NodeJS
COPY --from=alpine-node /usr/bin/node /usr/bin/
COPY --from=alpine-node /usr/lib/* /usr/lib/

# Copy Scripts
COPY scripts /tmp
RUN chmod +x /tmp/*.sh

# Install
RUN ash /tmp/install-packages.sh
RUN ash /tmp/install-php.sh
RUN ash /tmp/install-node-yarn.sh

# Cleanup
RUN ash /tmp/cleanup.sh
RUN rm -rf /tmp/*
