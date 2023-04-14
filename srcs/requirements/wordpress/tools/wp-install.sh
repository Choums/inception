#!/bin/sh

cd /var/www/wordpress

wp core install --path="/var/www/wordpress" \
                --url="https://chaidel@42.fr" \
                --title="Inception" \
                --admin_user="Chamsito" \
                --admin_password="Password" \
                --admin_email="chaidel@42.fr"

wp user create Chamsito chaidel@42.fr --role=administrator

wp user create random rand@42.fr --role=author

php-fpm8 -F