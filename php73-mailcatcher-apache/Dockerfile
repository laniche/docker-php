FROM dogstudio/php:7.3-apache
MAINTAINER Dogstudio <developers@dogstudio.be>

RUN apt-get install -y ssmtp --no-install-recommends && rm -r /var/lib/apt/lists/*

RUN echo "\
sendmail_path = /usr/sbin/ssmtp -t -i\n\
mail.add_x_header = On\n\
" >> /usr/local/etc/php/php.ini

RUN echo "\
mailhub=mailcatcher:1025\n\
UseTLS=NO\n\
FromLineOverride=YES\n\
" > /etc/ssmtp/ssmtp.conf
