FROM: alpine:3.16

RUN apk update && \
    apk add --no-cache \
        php7-fpm \
        php7-mysqli \
        php7-gd \
        php7-xml \
        php7-curl \
        php7-opcache \
        php7-json \
        php7-session \
        php7-zip \
        php7-mbstring \
        php7-openssl \
        php7-dom \
        php7-zlib \
        nginx \
        supervisor \
        curl \
        tar \
        gzip \
        wget \
        unzip

# Configuration de PHP-FPM
COPY php-fpm.conf /etc/php7/php-fpm.conf


# Téléchargement de WordPress et installation dans le répertoire /var/www
RUN wget https://wordpress.org/latest.tar.gz -O - | tar -xz -C /var/www && \
    mv /var/www/wordpress/* /var/www && \
    rm -rf /var/www/wordpress && \
    chown -R nginx:nginx /var/www


EXPOSE 9000

