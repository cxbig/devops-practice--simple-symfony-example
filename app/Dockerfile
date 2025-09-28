# dependencies stage
FROM composer:2.8 AS vendor
WORKDIR /app

# copy & install only composer files
COPY composer.json composer.lock ./
RUN composer install --no-dev --no-interaction --prefer-dist --no-progress --no-scripts

# then copy the rest
COPY . .
RUN composer dump-autoload -o

# app stage
FROM php:8.2-fpm-alpine

# install necessary modules
RUN set -eux; \
    apk add --no-cache --virtual .build-deps $PHPIZE_DEPS; \
    docker-php-ext-install pdo_mysql opcache; \
    pecl install redis-6.0.2; \
    docker-php-ext-enable redis; \
    apk del .build-deps

# suggested OpCache setup (can be merged into previous RUN)
RUN set -eux; \
    { \
      echo 'opcache.enable=1'; \
      echo 'opcache.validate_timestamps=0'; \
      echo 'opcache.jit=1255'; \
      echo 'opcache.jit_buffer_size=64M'; \
      echo 'opcache.memory_consumption=256'; \
      echo 'opcache.max_accelerated_files=20000'; \
    } > /usr/local/etc/php/conf.d/opcache.ini

ENV APP_ENV=prod \
    APP_DEBUG=0

WORKDIR /app
COPY --from=vendor /app /app

# non-root permissions
RUN chown -R www-data:www-data /app
USER www-data
