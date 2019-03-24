
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

This image was inspired by [benhutchins/docker-taiga-events](https://github.com/benhutchins/docker-taiga-events).

## What is Taiga?

Taiga is a project management platform for startups and agile developers & designers who want a simple, beautiful tool that makes work truly enjoyable.

> [taiga.io](https://taiga.io)

## Build Docker image

To generate docker images from the template, execute `update.sh` script.

Install Docker and then run `docker build -t docker-taiga-events images/VARIANT/VERSION` to build the image for the variant and version you need.

You can also build all images by running `update.sh build`.


# Adding Features
If the image does not include the packages you need, you can easily build your own image on top of it.
Start your derived image with the `FROM` statement and add whatever you like.

```Dockerfile
FROM monogramm/docker-taiga-events:alpine

RUN ...

```

You can also clone this repository and use the [update.sh](update.sh) shell script to generate a new Dockerfile based on your own needs.

For instance, you could build a container based on Dolibarr develop branch by setting the `update.sh` versions like this:
```bash
latests=( "master" )
```
Then simply call [update.sh](update.sh) script.

```console
bash update.sh
```
Your Dockerfile(s) will be generated in the `images/` folder.


## Auto configuration via environment variables

The Taiga-Events image supports auto configuration via environment variables. You can preconfigure nearly everything that is available in `config.json`.

See [config.example.json](https://github.com/taigaio/taiga-events/blob/master/config.example.json) for more details on configuration.


### RABBIT

*Default values*:
```
RABBIT_USER=guest
RABBIT_PASSWORD=guest
RABBIT_HOST=rabbitmq
RABBIT_PORT=5672
```

Configures RabbitMQ. Requires RabbitMQ.

Examples:
```
RABBIT_USER=taiga
RABBIT_PASSWORD=somethingverysecure
RABBIT_HOST=taiga_rabbitmq
RABBIT_PORT=5672
```

### TAIGA_EVENTS_SECRET

*Default value*: `mysupersecret`

Taiga Events secret key. Remember to set it in the backend too (same value as `TAIGA_SECRET_KEY`).

Examples:
```
TAIGA_EVENTS_SECRET=False
```

### TAIGA_EVENTS_PORT

*Default value*: `8888`

Taiga Events default port. Remember to set it in the front client too.

Examples:
```
TAIGA_EVENTS_PORT=8443
TAIGA_EVENTS_PORT=18888
```
