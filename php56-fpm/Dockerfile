FROM php:5.6-fpm
MAINTAINER Dogstudio <devs@dogstudio.be>

RUN apt-get update && apt-get install -y \
      mcrypt \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libmcrypt-dev \
      libpng12-dev

RUN docker-php-ext-install iconv mbstring mcrypt mysql mysqli pdo pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

# Configure PHP
RUN echo "max_execution_time = 6000\n\
memory_limit = 120M\n\
upload_max_filesize = 2M\n\
max_file_uploads = 20\n\
default_charset = \"UTF-8\"\n\
date.timezone = \"Europe/Brussels\"\n\
short_open_tag = Off" > /usr/local/etc/php/php.ini

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
RUN chmod +x /usr/bin/composer

RUN usermod -u 1000 www-data
RUN usermod -a -G users www-data

ONBUILD RUN composer install
CMD ["php-fpm"]
EXPOSE 9000
