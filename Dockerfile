FROM alpine
LABEL author="Simohin Timofei <65sumbox@gmail.com>"
RUN apk add --update --no-cache gettext nginx bash

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
COPY *.conf.template /etc/nginx/conf.d/
COPY ./init.sh /init.sh

CMD /init.sh
