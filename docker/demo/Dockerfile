FROM php:7.3-cli-alpine

# Install dev dependencies
RUN apk update \
    && apk upgrade --available \
    && apk add --virtual build-deps \
        autoconf \
        build-base \
        icu-dev \
        libevent-dev \
        openssl-dev \
        zlib-dev \
        libzip \
        libzip-dev \
        zlib \
        zlib-dev \
        bzip2 \
        git \
        mysql-client \
        nodejs \
        nodejs-npm \
        yarn \
        libpng \
        libpng-dev \
        libjpeg \
        libjpeg-turbo-dev \
        libwebp-dev \
        freetype \
        freetype-dev \
        curl \
        wget \
        bash

# Install and configure NodeJS Package Manager (npm)
ENV NODE_ENV production
RUN npm install -g npm
RUN npm config set cache ~/.cache/npm

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(getconf _NPROCESSORS_ONLN) \
    intl \
    gd \
    mbstring \
    pdo_mysql \
    sockets \
    zip
RUN pecl channel-update pecl.php.net \
    && pecl install -o -f \
        redis \
        event \
    && rm -rf /tmp/pear \
    && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
    && echo "extension=event.so" > /usr/local/etc/php/conf.d/event.ini

COPY ./demo/ /var/www/html

WORKDIR /var/www/html

RUN mkdir -p \
        /var/www/html/bin \
        /var/www/html/vendor \
        /var/www/html/storage

RUN chown -R www-data:www-data /var/www/html/storage

RUN env COMPOSER_MEMORY_LIMIT=-1 composer update --no-interaction

RUN bin/phing build-js

RUN bin/rr get

EXPOSE 8083

CMD ./rr serve
