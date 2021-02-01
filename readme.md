# gitlab-ci-php

This repository contains an `Dockerfile` which builds an image for your Gitlab CI/CD pipelines.

## Adding PHP Extensions

If you want to add more extensions than it's already installed, you will have to build your own image based on the one
currently built or modify
`Dockerfile` to your liking.

FROM immortalvision/gitlab-ci-php:latest

```dockerfile
RUN docker-php-ext-install -j "$(nproc)" gd
```