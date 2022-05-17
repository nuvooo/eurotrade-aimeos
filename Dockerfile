FROM php:8.1.0RC1-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y git

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql

RUN  apt-get install -y zlib1g-dev libicu-dev g++

RUN docker-php-ext-install intl


# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www
