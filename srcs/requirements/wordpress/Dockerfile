FROM: alpine:3.16

RUN apk update && \
    apk add --no-cache \
        php7-fpm \
        php7-mysqli \
        php7-gd \
        php7-xml \
        php7-curl \
        curl \

# Configuration de PHP-FPM
COPY php-fpm.conf /etc/php7/php-fpm.conf


EXPOSE 9000

COPY    /tools/wp-install.sh /wp-install.sh

RUN chmod +x wp-install.sh
ENTRYPOINT [ "wp-install.sh" ]