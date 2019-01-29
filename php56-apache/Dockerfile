FROM php:5.6-apache
MAINTAINER Dogstudio <developers@dogstudio.be>

RUN apt-get update && apt-get install -y \
    mcrypt wget zip unzip git \
    build-essential g++ \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libicu-dev \
    libzip-dev

RUN docker-php-ext-install iconv sockets mbstring mcrypt mysql mysqli pdo pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install intl \
    && docker-php-ext-install zip

RUN pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug

# Configure PHP
RUN echo "\
max_execution_time = 6000\n\
memory_limit = 1G\n\
upload_max_filesize = 20M\n\
max_file_uploads = 20\n\
default_charset = \"UTF-8\"\n\
date.timezone = \"Europe/Brussels\"\n\
short_open_tag = On" > /usr/local/etc/php/php.ini

# Configure xDebug
RUN echo "\
xdebug.enable=1\n\
xdebug.remote_enable=1\n\
xdebug.remote_connect_back=0\n\
xdebug.remote_port=9000\n\
xdebug.remote_host=\"192.168.99.1\"\n\
xdebug.idekey=\"PHPSTORM\"\n\
xdebug.extended_info=on\n\
xdebug.max_nesting_level=400\n\
xdebug.var_display_max_depth=10\n\
">> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
RUN chmod +x /usr/bin/composer

COPY 000-default.conf /etc/apache2/sites-available/
RUN a2enmod rewrite \
 && a2enmod headers \
 && a2enmod expires

RUN ln -sf /dev/stdout /var/log/apache2/access.log \
    && ln -sf /dev/stderr /var/log/apache2/error.log

# App dir
RUN mkdir -p /var/www
WORKDIR /var/www

RUN usermod -u 1000 www-data && usermod -a -G users www-data

EXPOSE 80 443
