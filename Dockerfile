ARG NODE_VERSION=21-alpine
ARG PHP_VERSION=8.2-fpm-alpine
FROM node:${NODE_VERSION} AS node
FROM php:${PHP_VERSION}
LABEL maintainer="Pezhvak <pezhvak@imvx.org>"
# NOTE: ARGs before FROM cannot be accessed during build time (https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact)
ARG NPM_VERSION=10.2.0
ARG COMPOSER_VERSION=2
ENV COMPOSER_ALLOW_SUPERUSER=1

# Copy PHP Extension Installer (https://github.com/mlocati/docker-php-extension-installer)
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions

# Copy NodeJS
COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
RUN ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm
RUN ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx

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
