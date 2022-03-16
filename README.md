[![License: AGPL v3][uri_license_image]][uri_license]
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/Monogramm/docker-taiga-events/Docker%20Image%20CI)](https://github.com/Monogramm/docker-taiga-events/actions)
[![Docker Automated buid](https://img.shields.io/docker/cloud/build/monogramm/docker-taiga-events.svg)](https://hub.docker.com/r/monogramm/docker-taiga-events/)
[![Docker Pulls](https://img.shields.io/docker/pulls/monogramm/docker-taiga-events.svg)](https://hub.docker.com/r/monogramm/docker-taiga-events/)
[![](https://images.microbadger.com/badges/version/monogramm/docker-taiga-events.svg)](https://microbadger.com/images/monogramm/docker-taiga-events)
[![](https://images.microbadger.com/badges/image/monogramm/docker-taiga-events.svg)](https://microbadger.com/images/monogramm/docker-taiga-events)

# Docker image for taiga-events

This Docker repository provides the [taiga-events](https://github.com/taigaio/taiga-events) server with a configuration suitable to use with [taiga-back](https://github.com/taigaio/taiga-back).

This image was inspired by [benhutchins/docker-taiga-events](https://github.com/benhutchins/docker-taiga-events).

## What is **Taiga**

Taiga is a project management platform for startups and agile developers & designers who want a simple, beautiful tool that makes work truly enjoyable.

> [taiga.io](https://taiga.io)

## Supported tags

[Dockerhub monogramm/docker-taiga-events](https://hub.docker.com/r/monogramm/docker-taiga-events/)

<!-- >Docker Tags -->

-   6.5.0-alpine 6.5-alpine 6.5.0 6.5  (`images/6.5/alpine/Dockerfile`)
-   6.4.0-alpine 6.4-alpine 6.4.0 6.4  (`images/6.4/alpine/Dockerfile`)
-   6.3.0-alpine 6.3-alpine 6.3.0 6.3  (`images/6.3/alpine/Dockerfile`)
-   6.2.3-alpine 6.2-alpine 6.2.3 6.2  (`images/6.2/alpine/Dockerfile`)
-   6.1.1-alpine 6.1-alpine 6.1.1 6.1  (`images/6.1/alpine/Dockerfile`)
-   6.0.2-alpine 6.0-alpine 6.0.2 6.0  (`images/6.0/alpine/Dockerfile`)
-   legacy-alpine 4.2-alpine 5.0-alpine 5.5-alpine legacy 4.2 5.0 5.5  (`images/legacy/alpine/Dockerfile`)

<!-- <Docker Tags -->

## Build Docker image

To generate docker images from the template, execute `update.sh` script.

Install Docker and then run `docker build -t docker-taiga-events images/VARIANT/VERSION` to build the image for the variant and version you need.

You can also build all images by running `update.sh build`.

## Adding Features

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

_Default values_:

```yml
RABBIT_USER=guest
RABBIT_PASSWORD=guest
RABBIT_HOST=rabbitmq
RABBIT_PORT=5672
RABBIT_VHOST=/
```

Configures RabbitMQ. Requires RabbitMQ.

Examples:

```yml
RABBIT_USER=taiga
RABBIT_PASSWORD=somethingverysecure
RABBIT_HOST=taiga_rabbitmq
RABBIT_PORT=5672
RABBIT_VHOST=/taiga
```

### TAIGA_EVENTS_SECRET

_Default value_: `!!!REPLACE-ME-j1598u1J^U*(y251u98u51u5981urf98u2o5uvoiiuzhlit3)!!!`

Taiga Events secret key. Remember to set it in the backend too (same value as `TAIGA_SECRET_KEY`).

Examples:

```yml
TAIGA_EVENTS_SECRET=somethingreallysecureandrandom
```

### TAIGA_EVENTS_PORT

_Default value_: `8888`

Taiga Events default port. Remember to set it in the front client too.

Examples:

```yml
TAIGA_EVENTS_PORT=8443
TAIGA_EVENTS_PORT=18888
```

* * *

[uri_license]: http://www.gnu.org/licenses/agpl.html

[uri_license_image]: https://img.shields.io/badge/License-AGPL%20v3-blue.svg
