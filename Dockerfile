FROM composer:latest as composer

FROM php:8.0-fpm

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y \
    unzip

RUN pecl install xdebug && docker-php-ext-enable xdebug

WORKDIR /var/www/html