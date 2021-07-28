#!/bin/bash

export HEROKU_PORT="${PORT:-80}"

TEMPLATE=$([[ -z "${APPLICATION_PORT}" ]] && echo "/etc/nginx/conf.d/dummy.conf.template" || echo "/etc/nginx/conf.d/proxy.conf.template")

envsubst < ${TEMPLATE} > /etc/nginx/conf.d/server.conf

CMD=$([[ -z "${ENTRYPOINT_SCRIPT}" ]] && echo "daemon off;" >> /etc/nginx/nginx.conf || echo ${ENTRYPOINT_SCRIPT})

echo "Nginx started"
nginx
exec ${CMD}
