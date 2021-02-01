#!/usr/bin/env ash

# Installing Node (https://github.com/mhart/alpine-node)
ln -s /usr/lib/npm/bin/npm-cli.js /usr/bin/npm
npm install -g --force npm@${NPM_VERSION}
echo $NPM_VERSION

# Installing Yarn
touch ~/.profile
curl -o- -L https://yarnpkg.com/install.sh | ash

# Cleanup
rm -rf /usr/share/man /var/cache/apk/* \
  /root/.npm /root/.node-gyp /root/.gnupg /usr/lib/node_modules/npm/man \
  /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html /usr/lib/node_modules/npm/scripts
