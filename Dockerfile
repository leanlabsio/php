FROM gliderlabs/alpine:latest

RUN apk update \
    && apk add php-fpm \
    && apk add php-mcrypt \
    && apk add php-json \
    && apk add php-curl \
    && apk add php-opcache

ADD build-extensions.sh /

RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' /etc/php/php-fpm.conf && \
    sed -i 's/listen.allowed_clients = 127.0.0.1/;listen.allowed_clients = 127.0.0.1/g' /etc/php/php-fpm.conf

RUN /bin/sh /build-extensions.sh
