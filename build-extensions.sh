apk add alpine-sdk
apk add php-dev
apk add autoconf
apk add cmake
apk add openssl-dev

cd /tmp
git clone https://github.com/phpredis/phpredis.git
cd /tmp/phpredis
git checkout 2.2.7
phpize
./configure
make
make install

echo "extension=redis.so" >> /etc/php/conf.d/redis.ini

cd /tmp
git clone https://github.com/alanxz/rabbitmq-c.git
cd /tmp/rabbitmq-c
git checkout v0.4.1
mkdir build && cd build
cmake ..
cmake --build . --target install

cd /tmp
git clone https://github.com/pdezwart/php-amqp.git
cd /tmp/php-amqp
git checkout v1.4.0
phpize 
./configure 
make 
make install

echo "extension=amqp.so" >> /etc/php/conf.d/amqp.ini

rm -rf /tmp/*

apk del --purge openssl-dev
apk del --purge cmake
apk del --purge autoconf
apk del --purge php-dev
apk del --purge alpine-sdk

