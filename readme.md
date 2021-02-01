# Gitlab-CI-PHP

## About

This repository contains an `Dockerfile` which builds an image for your Gitlab CI/CD pipelines.

## Adding more PHP extensions

We created the `Dockerfile` with image size in mind, so only packages and extensions which is absolutely necessary is
installed.

If you want to add more extensions, you will have to build your own image based on the one already built or modify
the `Dockerfile` to your liking.

see [Docekr PHP Extension Installer](https://github.com/mlocati/docker-php-extension-installer)
for available extensions, although you can install them yourself.

```dockerfile
FROM immortalvision/gitlab-ci-laravel:latest
RUN docker-php-ext-install -j "$(nproc)" <package_name>
```

# Testing

Tests are written using [GOSS](https://github.com/aelsabbahy/goss/tree/master/extras/dcgoss), to validate your container
run:

```shell
GOSS_FILES_PATH=tests dgoss run --rm -it immortalvision/gitlab-ci-php:latest
```

# References

- [Useful Issue](https://github.com/docker-library/php/issues/1049)