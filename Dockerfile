FROM gliderlabs/alpine:latest

RUN apk update \
    && apk add php-fpm \
    && apk add php-mcrypt \
    && apk add php-json \
    && apk add php-curl \
    && apk add php-intl \
    && apk add php-opcache

ADD build-extensions.sh /

RUN /bin/sh /build-extensions.sh
