FROM php:8.1-fpm
RUN apt-get update && apt-get install -y net-tools && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install pdo pdo_mysql
COPY www.conf /usr/local/etc/php-fpm.d/www.conf
