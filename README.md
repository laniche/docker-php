# PHP Container for Dogs

Create PHP micro-services that we can use for developments at Dogstudio.

## Versions

* `latest`, `stable`, `7.3-apache` [Dockerfile](https://github.com/Dogstudio/docker-php/blob/master/php73-apache/Dockerfile)
* `7.1-apache` [Dockerfile](https://github.com/Dogstudio/docker-php/blob/master/php71-apache/Dockerfile)
* `7-apache` [Dockerfile](https://github.com/Dogstudio/docker-php/blob/master/php7-apache/Dockerfile)
* `5.6-apache` [Dockerfile](https://github.com/Dogstudio/docker-php/blob/master/php56-apache/Dockerfile)
* `5.6-mailcatcher` [Dockerfile](https://github.com/Dogstudio/docker-php/blob/master/php56-mailcatcher/Dockerfile)

* `7-fpm` [Dockerfile](https://github.com/Dogstudio/docker-php/blob/master/php7-fpm/Dockerfile)
* `5.6-fpm` [Dockerfile](https://github.com/Dogstudio/docker-php/blob/master/php56-fpm/Dockerfile)

## Usage

You can use this containter directly with `php56-apache` and `php7-apache` tags.
Or with a web proxy, like `nginx` with `php56-fpm` and `php7-fpm` tags.

## Xdebug

These container are configured to provide `xdebug` support with _"PHP Storm"_.

## Mailcatcher

The version `5.6-mailcatcher` is based on Apache version `5.6-apache` and use ssmtp to send email to a mailcatcher container.

The you must add `mailcatcher` to you docker-compose :

    mailcatcher:
        image: "schickling/mailcatcher"
        ports:
            - "1025"
            - "1080:1080"