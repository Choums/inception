#!/bin/sh
sleep 10
# cd /var/www/wordpress

# Définition des variables
if ! [ -f "/var/www/wordpress/wp-config.php" ]; then

	WP_PATH="/var/www/wordpress"                  # chemin d'installation de WordPress
	WP_URL="https://chaidel.42.fr"  # URL de votre site WordPress
	WP_TITLE="Inception"            # titre de votre site WordPress
	WP_ADMIN_USER="Chamsito"        # nom d'utilisateur de l'administrateur
	WP_PASS="tes1"                  # mot de passe de l'administrateur
	WP_ADMIN_EMAIL="chaidel@42.fr"  # e-mail de l'administrateur

# Téléchargement et installation de WordPress
    wp core download --path="$WP_PATH"

    wp config create    --dbname="wordpress" \
                        --dbuser="wpuser" \
                        --dbpass="wppass" \
                        --dbhost=mariadb:3306 \
                        --path="$WP_PATH" \
                        --allow-root

    wp core install --path="$WP_PATH" \
                    --url="$WP_URL" \
                    --title="$WP_TITLE" \
                    --admin_user="$WP_ADMIN_USER" \
                    --admin_password="$WP_PASS" \
                    --admin_email="$WP_ADMIN_EMAIL"

    # Creation d'un user admin et un auteur
    wp user create --path="$WP_PATH" $WP_ADMIN_USER $WP_ADMIN_EMAIL --role=administrator

    wp user create --path="$WP_PATH" random rand@42.fr --role=author
fi

if ! [ "/run/php" ]; then
    mkdir /run/php
fi

echo "Wordpress installation succesful !"
echo "URL: $WP_URL"
echo "Admin: $WP_ADMIN_USER"

echo "Lancement PHP-FPM !"
/usr/sbin/php-fpm7 --nodaemonize