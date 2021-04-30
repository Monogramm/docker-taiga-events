#!/bin/sh

log() {
  echo "[$(date +%Y-%m-%dT%H:%M:%S%:z)] $*"
}

if [ ! -f /taiga/config.json ]; then
  log "Taiga events configuration missing!"
  exit 1
fi

#########################################
## Taiga Events config (legacy & 6.0+)
#########################################

if [ -n "${RABBIT_HOST:-$RABBITMQ_HOST}" ]; then
  log "Updating Taiga RabbitMQ URL (legacy): ${RABBIT_HOST:-$RABBITMQ_HOST}"
  sed -i \
    -e "s|\"url\": \".*\",|\"url\": \"amqp://${RABBIT_USER:-$RABBITMQ_USER}:${RABBIT_PASSWORD:-$RABBITMQ_PASSWORD}@${RABBIT_HOST:-$RABBITMQ_HOST}:${RABBIT_PORT:-$RABBITMQ_PORT}${RABBIT_VHOST:-$RABBITMQ_VHOST}\",|g" \
    /taiga/config.json

  export RABBITMQ_URL=amqp://${RABBIT_USER:-$RABBITMQ_USER}:${RABBIT_PASSWORD:-$RABBITMQ_PASSWORD}@${RABBIT_HOST:-$RABBITMQ_HOST}:${RABBIT_PORT:-$RABBITMQ_PORT}${RABBIT_VHOST:-$RABBITMQ_VHOST}
fi

if [ -n "${TAIGA_EVENTS_SECRET}" ]; then
  log "Updating Taiga Events secret (legacy): (don't expect to find those in the logs...)"
  sed -i \
    -e "s|\"secret\": \".*\",|\"secret\": \"${TAIGA_EVENTS_SECRET}\",|g" \
    /taiga/config.json

  export SECRET=${TAIGA_EVENTS_SECRET}
fi

if [ -n "${TAIGA_EVENTS_PORT}" ]; then
  log "Updating Taiga Events default port (legacy): ${TAIGA_EVENTS_PORT}"
  sed -i \
    -e "s|\"port\": \".*\",|\"port\": \"${TAIGA_EVENTS_PORT}\",|g" \
    /taiga/config.json

  export WEB_SOCKET_SERVER_PORT=${TAIGA_EVENTS_PORT}
fi

# Start
log "Executing Taiga Events command"
exec "$@"
