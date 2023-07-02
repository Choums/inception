#!/bin/sh

cd /var/www/wordpress

if [ -f "/var/www/wordpress/wp-config.php" ]; then

    wp config create    --dbname=$MYSQL_DB\
                        --dbuser=$MYSQL_USER\
                        --dbpass=$MYSQL_PASSWORD\
                        --dbhost=mariadb:3306 --path='/var/www/wordpress'\
                        --allow-root

    wp core install --path="/var/www/wordpress" \
                    --url="https://chaidel@42.fr" \
                    --title="Inception" \
                    --admin_user="Chamsito" \
                    --admin_password="Password" \
                    --admin_email="chaidel@42.fr"

    wp user create Chamsito chaidel@42.fr --role=administrator

    wp user create random rand@42.fr --role=author
fi

if ! [ -d "/run/php" ]; then
    mkdir /run/php
fi

/usr/sbin/php-fpm7 --nodaemonize
