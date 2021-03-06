FROM node:alpine

# Taiga back and events properties
ENV TAIGA_VERSION=6.0.2 \
    RABBITMQ_VHOST=/taiga \
    RABBITMQ_USER=guest \
    RABBITMQ_PASS=guest \
    RABBITMQ_HOST= \
    RABBITMQ_PORT=5672 \
    SECRET=!!!REPLACE-ME-j1598u1J^U*(y251u98u51u5981urf98u2o5uvoiiuzhlit3)!!! \
    WEB_SOCKET_SERVER_PORT=8888 \
    APP_PORT=3023

COPY entrypoint.sh /
COPY config.json /taiga/

WORKDIR /usr/src/taiga-events

# Get Taiga-Events
ADD https://github.com/taigaio/taiga-events/archive/${TAIGA_VERSION}.tar.gz /tmp/taiga-events-${TAIGA_VERSION}.tar.gz

# Install the packages we need
# Install Taiga from tag archive
# Setup symbolic links for configuration files
RUN set -ex; \
    apk add --no-cache \
        curl \
        tar \
    ; \
    rm -rf /var/cache/apk/*; \
    chmod 755 /entrypoint.sh; \
    rm -f /etc/nginx/sites-enabled/default; \
    mkdir -p /tmp/taiga-events; \
    tar xzf "/tmp/taiga-events-${TAIGA_VERSION}.tar.gz" -C /tmp/taiga-events; \
    rm "/tmp/taiga-events-${TAIGA_VERSION}.tar.gz"; \
    mkdir -p /usr/src/taiga-events; \
    cp -r "/tmp/taiga-events/taiga-events-${TAIGA_VERSION}"/* /usr/src/taiga-events; \
    rm -rf /tmp/taiga-events; \
    ln -s /taiga/config.json /usr/src/taiga-events/config.json; \
    npm install --production; \
    npm install -g coffee-script

ENTRYPOINT ["/entrypoint.sh"]
CMD ["npm", "run", "start:production"]

# Arguments to label built container
ARG VCS_REF=unknown
ARG BUILD_DATE=unknown
ARG VERSION=6.0.2

# Container labels (http://label-schema.org/)
# Container annotations (https://github.com/opencontainers/image-spec)
LABEL maintainer="Monogramm Maintainers <opensource at monogramm dot io>" \
      product="Taiga Events" \
      version=$VERSION \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/Monogramm/docker-taiga-events/" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Taiga Events" \
      org.label-schema.description="Taiga is a project management platform for startups and agile developers & designers who want a simple, beautiful tool that makes work truly enjoyable." \
      org.label-schema.url="https://www.taiga.io/" \
      org.label-schema.vendor="Taiga" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0" \
      org.opencontainers.image.revision=$VCS_REF \
      org.opencontainers.image.source="https://github.com/Monogramm/docker-taiga-events/" \
      org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.title="Taiga Events" \
      org.opencontainers.image.description="Taiga is a project management platform for startups and agile developers & designers who want a simple, beautiful tool that makes work truly enjoyable." \
      org.opencontainers.image.url="https://www.taiga.io/" \
      org.opencontainers.image.vendor="Taiga" \
      org.opencontainers.image.version=$VERSION \
      org.opencontainers.image.authors="Monogramm Maintainers <opensource at monogramm dot io>"
