FROM alpine:3.16

RUN apk update && \
	apk add --no-cache php8 \
	php8-fpm \
	php8-phar \
	php8-json \
	php8-mysqli \
	php8-curl \
	php8-gd \
	php8-mbstring \
	php8-xml \
	php8-openssl \
	php8-zip \
	curl \
	tar

WORKDIR /var/www
RUN chmod +x /var/www

# Installation de WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
	tar -xzf latest.tar.gz && \
	rm latest.tar.gz && \
	mv wordpress /var/www/

# Installation de WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY ./tools/wp-config.php /var/www/wp-config.php
RUN chmod +x /var/www/wp-config.php

COPY ./tools/wp-install.sh	/wp-install.sh
RUN chmod +x /wp-install.sh

ENTRYPOINT [ "/wp-install.sh" ]