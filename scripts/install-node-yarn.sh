#!/usr/bin/env ash

# Installing Node
npm install -g --force npm@${NPM_VERSION}

# Installing Yarn
touch ~/.profile
curl -o- -L https://yarnpkg.com/install.sh | ash

# Installing cloudflare-cli
npm install -g cloudflare-cli

# Cleanup
rm -rf /usr/share/man /var/cache/apk/* \
  /root/.npm /root/.node-gyp /root/.gnupg /usr/lib/node_modules/npm/man \
  /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html /usr/lib/node_modules/npm/scripts
