#!/bin/sh

sleep 10

#Check if wp-config exist to not relaunch the config script everytime we launch the container
if ! [ -f "/var/www/wordpress/wp-config.php" ]; then
	wp config create	--dbname=$MYSQL_DB \
						--dbuser=$MYSQL_USER \
						--dbpass=$MYSQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress' \
						--allow-root \
	&& wp core install	--title="chaidel.42.fr" \
						--url="chaidel.42.fr" \
						--path='/var/www/wordpress' \
						--admin_user="chaidel" \
						--admin_password=$WP_PASS \
						--admin_email="chaidel@student.42.fr" \
						--skip-email \
						--allow-root \
	&& wp user create	author rand@example.com \
						--path='/var/www/wordpress' \
						--role=author \
						--user_pass=$TEST_PASS \
						--allow-root
fi

#Check if /run/php exist to prevent an error from php
if ! [ -d "/run/php" ]; then
	mkdir /run/php
fi

echo "Wordpress installation succesful !"

echo "Lancement PHP-FPM !"
/usr/sbin/php-fpm7 --nodaemonize