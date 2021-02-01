#!/usr/bin/env ash

# Installing Node (https://github.com/mhart/alpine-node)
npm i -g npm
curl -o- -L https://yarnpkg.com/install.sh | bash

# Cleanup
rm -rf /usr/share/man /var/cache/apk/* \
  /root/.npm /root/.node-gyp /root/.gnupg /usr/lib/node_modules/npm/man \
  /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html /usr/lib/node_modules/npm/scripts
