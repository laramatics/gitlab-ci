FROM php:8.0.1-alpine
LABEL maintainer="Pezhvak <pezhvak@imvx.org>"

# Install PHP Extension Installer (https://github.com/mlocati/docker-php-extension-installer)
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

# Setting up dependencies
COPY scripts /tmp
RUN chmod +x /tmp/*.sh \
    && ash /tmp/install-packages.sh \
    && ash /tmp/install-node-yarn.sh \
    && ash /tmp/install-php.sh
# Cleanup
RUN rm -rf /tmp/*