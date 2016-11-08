FROM php:7.0-cli
MAINTAINER Dogstudio <developers@dogstudio.be>

RUN apt-get update -y && apt-get install -y git zip unzip mcrypt

RUN docker-php-ext-install sockets mbstring mysqli pdo pdo_mysql intl

# Configure xDebug
RUN pecl install xdebug && docker-php-ext-enable xdebug && echo "\
xdebug.enable=1\n\
xdebug.remote_enable=1\n\
xdebug.remote_connect_back=0\n\
xdebug.remote_port=9000\n\
xdebug.remote_host=\"192.168.65.1\"\n\
xdebug.idekey=\"PHPSTORM\"\n\
xdebug.extended_info=on\n\
xdebug.max_nesting_level=400\n\
xdebug.var_display_max_depth=10\n\
">> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# App dir
VOLUME [ "/opt/phpapp" ]
WORKDIR /opt/phpapp

ENTRYPOINT ["php"]
CMD [ "-v" ]
