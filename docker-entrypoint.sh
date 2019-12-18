#!/bin/sh

if [ ! -f /taiga/config.json ]; then
  echo "Taiga events configuration missing!"
  exit 1
fi

#########################################
## Taiga Events config
#########################################

if [ -n "$RABBIT_HOST" ]; then
  echo "Updating Taiga RabbitMQ URL: $RABBIT_HOST"
  sed -i \
    -e "s|\"url\": \".*\",|\"url\": \"amqp://${RABBIT_USER}:${RABBIT_PASSWORD}@${RABBIT_HOST}:${RABBIT_PORT}/${RABBIT_VHOST}\",|g" \
    /taiga/config.json
fi

if [ -n "$TAIGA_EVENTS_SECRET" ]; then
  echo "Updating Taiga Events secret: (don't expect to find those in the logs...)"
  sed -i \
    -e "s|\"secret\": \".*\",|\"secret\": \"$TAIGA_EVENTS_SECRET\",|g" \
    /taiga/config.json
fi

if [ -n "$TAIGA_EVENTS_PORT" ]; then
  echo "Updating Taiga Events default port: $TAIGA_EVENTS_PORT"
  sed -i \
    -e "s|\"port\": \".*\",|\"port\": \"$TAIGA_EVENTS_PORT\",|g" \
    /taiga/config.json
fi

# Start coffee script
exec "$@"
