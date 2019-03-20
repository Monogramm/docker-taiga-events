
[uri_license]: http://www.gnu.org/licenses/agpl.html
[uri_license_image]: https://img.shields.io/badge/License-AGPL%20v3-blue.svg

[![License: AGPL v3][uri_license_image]][uri_license]
[![Build Status](https://travis-ci.org/Monogramm/docker-taiga-events.svg)](https://travis-ci.org/Monogramm/docker-taiga-events)
[![Docker Automated buid](https://img.shields.io/docker/cloud/build/monogramm/docker-taiga-events.svg)](https://hub.docker.com/r/monogramm/docker-taiga-events/)
[![Docker Pulls](https://img.shields.io/docker/pulls/monogramm/docker-taiga-events.svg)](https://hub.docker.com/r/monogramm/docker-taiga-events/)
[![](https://images.microbadger.com/badges/version/monogramm/docker-taiga-events.svg)](https://microbadger.com/images/monogramm/docker-taiga-events)
[![](https://images.microbadger.com/badges/image/monogramm/docker-taiga-events.svg)](https://microbadger.com/images/monogramm/docker-taiga-events)

# Docker image for taiga-events

This Docker repository provides the [taiga-events](https://github.com/taigaio/taiga-events) server with a configuration suitable to use with [taiga-back](https://github.com/taigaio/taiga-back).

:construction: **This container is still in development!**

This image was inspired by [benhutchins/docker-taiga-events](https://github.com/benhutchins/docker-taiga-events).

## What is Taiga?

Taiga is a project management platform for startups and agile developers & designers who want a simple, beautiful tool that makes work truly enjoyable.

> [taiga.io](https://taiga.io)

## Build Docker image

To generate docker images from the template, execute `update.sh` script.

Install Docker and then run `docker build -t docker-taiga-events images/VARIANT/VERSION` to build the image for the variant and version you need.

You can also build all images by running `update.sh build`.
