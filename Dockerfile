FROM php:7.1.9-cli

RUN apt-get update \
    && apt-get install -y \
        libpng12-dev \
        libjpeg-dev  \
        curl \
        sed \
        zlib1g-dev \
        git-core \
    && docker-php-ext-install \
        zip \
        mysqli

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /user/src/myapp

CMD composer install --no-dev
