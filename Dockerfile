FROM php:8.0.1-alpine
LABEL maintainer="Pezhvak <pezhvak@imvx.org>"

## this fixes dns issues
RUN echo -e "http://nl.alpinelinux.org/alpine/v3.5/main\nhttp://nl.alpinelinux.org/alpine/v3.5/community" > /etc/apk/repositories

# Install PHP Extension Installer (https://github.com/mlocati/docker-php-extension-installer)
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

# Install NodeJS
COPY --from=mhart/alpine-node:15 /usr/bin/node /usr/bin/npm /usr/bin/

# Setting up dependencies
COPY scripts /tmp
RUN chmod +x /tmp/*.sh
RUN ash /tmp/install-packages.sh
RUN ash /tmp/install-php.sh
RUN ash /tmp/install-node-yarn.sh
# Cleanup
RUN ash /tmp/cleanup.sh
RUN rm -rf /tmp/*
