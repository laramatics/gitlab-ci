<div align="center">

# Laravel Gitlab-CI

![GitHub](https://img.shields.io/github/license/laramatics/gitlab-ci)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/laramatics/gitlab-ci/latest)
![Docker Pulls](https://img.shields.io/docker/pulls/laramatics/gitlab-ci)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/laramatics/gitlab-ci)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/laramatics/gitlab-ci)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/laramatics/gitlab-ci)

</div>

## About

A `Dockerfile` for building an [image](https://hub.docker.com/r/laramatics/gitlab-ci)
for your Laravel app Gitlab CI/CD pipelines.

### Table of Contents

- [Folder Structure](#folder-structure)
- [Packages and Services](#packages-and-services)
    - [Customizing build versions](#customizing-build-versions)
    - [Adding more PHP extensions](#adding-more-php-extensions)
    - [Adding more packages](#adding-more-packages)
    - [Testing](#testing)
- [References](#references)

## Folder Structure

Although folder structure is self-explanatory, description is as below:

```
.
├── Dockerfile
├── LICENSE
├── readme.md
├── scripts
│   ├── cleanup.sh            # Removes build dependencies for lighter image size.
│   ├── install-node-yarn.sh  # Install your global npm/yarn packages here.
│   ├── install-packages.sh   # OS packages will be installed by this file.
│   └── install-php.sh        # PHP extensions and installation.
└── tests
    └── goss.yaml             # See "testing" section
```

## Packages and Services

We created the `Dockerfile` with image size in mind, only packages and PHP extensions which are absolutely necessary
are installed.

|Service|Version|Argument|
|---|:---:|:---:|
|PHP|8.1.1|`PHP_VERSION`|
|Composer|2.2.5|`COMPOSER_VERSION`|
|Node|17.4.0|`NODE_VERSION`|
|NPM|8.3.2|`NPM_VERSION`|
|Yarn|latest|`N/A`|
|[reg](https://github.com/genuinetools/reg)|latest|`N/A`|
|[cfcli](https://github.com/danielpigott/cloudflare-cli)|latest|`N/A`|
|[local-php-security-checker](https://github.com/fabpot/local-php-security-checker)|latest|`N/A`|

### Customizing build versions

As you can see in the table above, some services have an argument in `Dockerfile` for you to modify the installation version.
To do so, you need to clone the repo and build the image yourself:

```bash
git clone https://github.com/laramatics/gitlab-ci.git
cd gitlab-ci
# Modify files...
docker build \
  --build-arg NPM_VERSION=8.3.2 \
  --build-arg PHP_VERSION=8.1.1 \
  -t <image_name> .
```

### Adding more PHP extensions

If you want to add more extensions to the PHP installation, you will have to build your own image based on the one
already built or modify the `Dockerfile` and `scripts/*` to your liking and [build your own image from it](#adding-more-packages).

See [Docker PHP Extension Installer](https://github.com/mlocati/docker-php-extension-installer)
for available extensions, alternatively you can install them fom source.

```dockerfile
FROM laramatics/gitlab-ci:latest
# Add your extentions here...
RUN docker-php-ext-install -j "$(nproc)" <package_name>
```

### Adding more packages

Sometimes you need a specific package for your pipeline; as described in the previous section, you can build your own
image from `laramatics/gitlab-ci` or clone this repo and modify files to suit your needs.

```shell
git clone https://github.com/laramatics/gitlab-ci.git
cd gitlab-ci
# Modify files...
docker build -t <image_name> .
```

### Testing

Tests are written using [GOSS](https://github.com/aelsabbahy/goss/tree/master/extras/dcgoss), to test your changes after
modifying source files and building your own image, run:

```shell
GOSS_FILES_PATH=tests dgoss run -it <image_name>
```

# References

- [Useful issue](https://github.com/docker-library/php/issues/1049)
