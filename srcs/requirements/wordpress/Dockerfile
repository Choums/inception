FROM alpine:3.14

RUN apk update && apk upgrade \
	&& apk add --no-cache php \
	php7-fpm \
	php7-phar \
	php7-json \
	php-mysqli \
	mariadb-client \
	php7-mbstring \
	wget \
	curl \
	tar

RUN mkdir -p /var/www
WORKDIR /var/www
RUN chmod +x /var/www

# Installation de WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
	tar -xzf latest.tar.gz && \
	rm latest.tar.gz && \
	mv wordpress /var/www/

#Change root owner to write inside /var/www/wordpress
RUN chown -R root:root /var/www/wordpress

# Installation de WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# Creer l'user etl'assigne au groupe
RUN adduser -D -G www-data www-data

COPY ./tools/www.conf /etc/php7/php-fpm.d/www.conf
RUN chmod +x /etc/php7/php-fpm.d/www.conf

# COPY ./tools/wp-config.php /var/www/wp-config.php
# RUN chmod +x /var/www/wp-config.php

COPY ./tools/wp-install.sh .
RUN chmod +x wp-install.sh

EXPOSE 9000

ENTRYPOINT [ "/bin/sh", "wp-install.sh" ]