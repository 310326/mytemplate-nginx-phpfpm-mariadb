FROM php:7.4-fpm-alpine
MAINTAINER satomitsuru

# agent user
ARG AGENT_UID=1000
RUN adduser -D -s /bin/sh -u ${AGENT_UID} appagent
# RUN adduser -D -H -s /bin/sh -u ${AGENT_UID} appagent

# setup php
RUN apk update
RUN apk --no-cache add \
  oniguruma-dev \
  curl-dev \
#  libmcrypt-dev \
  freetype-dev \
  libjpeg-turbo-dev \
  libpng-dev \
  libxml2-dev \
  zlib-dev \
  libzip-dev \
  && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
  && docker-php-ext-install -j${NPROC} \
#    curl \
#    dom \
#    mbstring \
#    mcrypt \
#    openssl \
    mysqli \
#    pdo \
    pdo_mysql \
#    simplexml \
    zip \
  && docker-php-ext-configure gd \
#    --with-freetype-dir=/usr/include/ \
#    --with-jpeg-dir=/usr/include/ \
#    --with-png-dir=/usr/include/ \
  && docker-php-ext-install -j${NPROC} gd \
  && mkdir -p /var/run/php-fpm \
  && chown appagent:appagent /var/run/php-fpm

# put config
COPY ./php/php.ini /usr/local/etc/php/php.ini
COPY ./php-fpm/www.conf /usr/local/etc/php-fpm.d/zzz-www.conf

VOLUME ["/var/run/php-fpm"]
VOLUME ["/var/www"]

# setup php Laravel
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('sha384', 'composer-setup.php') === 'e5325b19b381bfd88ce90a5ddb7823406b2a38cff6bb704b0acc289a09c8128d4a8ce2bbafcd1fcbdc38666422fe2806') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer
#  ENV COMPOSER_ALLOW_SUPERUSER 1 \
#  ENV COMPOSER_HOME /composer
#  ENV PATH $PATH:/composer/vendor/bin \

USER appagent
RUN composer global require "laravel/installer"