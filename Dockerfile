FROM gliderlabs/alpine:latest

RUN apk update \
    && apk add php-fpm \
    && apk add php-cli \
    && apk add php-mcrypt \
    && apk add php-json \
    && apk add php-pear \
    && apk add php-opcache

RUN apk add alpine-sdk \
    && apk add php-dev \
    && apk add autoconf \
    && apk add cmake \
    && apk add openssl-dev

WORKDIR /tmp

RUN git clone https://github.com/phpredis/phpredis.git

WORKDIR /tmp/phpredis

RUN git checkout 2.2.7

RUN phpize \
    && ./configure \
    && make \
    && make install

RUN echo "extension=redis.so" >> /etc/php/conf.d/redis.ini

WORKDIR /tmp

RUN rm -rf phpredis

RUN apk del --purge openssl-dev \
    && apk del --purge cmake \
    && apk del --purge autoconf \
    && apk del --purge php-dev \
    && apk del --purge alpine-sdk

