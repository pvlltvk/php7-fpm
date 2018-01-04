FROM php:fpm-alpine
MAINTAINER Pavel Litvyak <pvlltvk@gmail.com>

# Set environment variables to use them in PHP config files
ENV FPM_PM static
ENV FPM_PM_MAX_CHILDREN 4
ENV PHP_DATE_TIMEZONE Europe/Moscow
ENV PHP_MEMORY_LIMIT 256M
ENV PHP_POST_MAX_SIZE 20M
ENV PHP_UPLOAD_MAX_SIZE 20M
ENV PHP_SMTP localhost
ENV PHP_SMTP_PORT 25

#Set timezone
RUN apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/`echo $PHP_DATE_TIMEZONE` /etc/localtime

# Install dependencies for PHP extentions
RUN apk add --no-cache --virtual .php-extentions-deps \
    libpng-dev \
    libjpeg-turbo-dev \
    postgresql-dev \
    libxml2-dev \
    libmcrypt-dev \
    git

# Configure and install PHP extentions 
RUN docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && pecl bundle -d /usr/src/php/ext redis \
    && rm /usr/src/php/ext/redis-*.tgz \
    && pecl bundle -d /usr/src/php/ext mcrypt \
    && rm /usr/src/php/ext/mcrypt-*.tgz \
    && docker-php-ext-install gd pdo pdo_mysql pdo_pgsql xmlrpc mcrypt opcache redis zip

# Delete old config files 
RUN rm -r /usr/local/etc/php-fpm.conf /usr/local/etc/php-fpm.conf.default /usr/local/etc/php-fpm.d/*

# Copy PHP and PHP-FPM config files
COPY php.ini /usr/local/etc/php/
COPY php-fpm.conf /usr/local/etc/
COPY www.conf /usr/local/etc/php-fpm.d/

# Set UID for www-data user to 33
RUN deluser xfs \
    && deluser www-data \
    && addgroup -g 33 -S www-data \
    && adduser -u 33 -D -S -G www-data -h /var/www -g www-data www-data

RUN echo "<?php phpinfo(); ?>" > /var/www/info.php && \ 
    chown -R www-data:www-data /var/www

WORKDIR /var/www
EXPOSE 9000
CMD ["/usr/local/sbin/php-fpm"]
