FROM php:7.0-apache
MAINTAINER Dogstudio <developers@dogstudio.be>

RUN apt-get update && apt-get install -y     mcrypt wget zip unzip git     build-essential     libfreetype6-dev     libjpeg62-turbo-dev     libmcrypt-dev     libpng12-dev     libicu-dev g++ libicu52

RUN docker-php-ext-install iconv sockets mbstring mcrypt mysqli pdo pdo_mysql     && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/     && docker-php-ext-install gd     && docker-php-ext-install intl

# Configure PHP
RUN echo "max_execution_time = 6000\n\
memory_limit = 120M\n\
upload_max_filesize = 2M\n\
max_file_uploads = 20\n\
default_charset = \"UTF-8\"\n\
date.timezone = \"Europe/Brussels\"\n\
short_open_tag = Off" > /usr/local/etc/php/php.ini

# Configure xDebug
RUN pecl install xdebug && docker-php-ext-enable xdebug && echo "\
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
RUN a2ensite 000-default
RUN a2enmod rewrite

RUN ln -sf /dev/stdout /var/log/apache2/access.log
RUN ln -sf /dev/stderr /var/log/apache2/error.log

RUN usermod -u 1000 www-data
RUN usermod -a -G users www-data

# App dir
RUN mkdir -p /var/www
WORKDIR /var/www

EXPOSE 80 443
