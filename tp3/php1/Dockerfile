# Ce Dockerfile crée un conteneur PHP‑FPM 8.1 prêt pour Apache en installant les extensions PDO/MySQL 
# et en appliquant une configuration www.conf qui écoute sur 0.0.0.0:9000.
FROM php:8.1-fpm
RUN apt-get update && apt-get install -y net-tools && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install pdo pdo_mysql
COPY www.conf /usr/local/etc/php-fpm.d/www.conf
