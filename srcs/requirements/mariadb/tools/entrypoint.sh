#!/bin/sh

if [ ! -d "/var/lib/mysql/$MYSQL_DB" ]; then

cat << EOF > /tmp/init.sql
USE mysql;
FLUSH PRIVILEGES;
--# Create table SQL_DATABASE
CREATE DATABASE IF NOT EXISTS $MYSQL_DB;

--# Create user
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';

--# Give right to User
GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';

--# Change root password
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';

--# Refresh change
FLUSH PRIVILEGES;
EOF

/usr/bin/mysqld --user=mysql --bootstrap < /tmp/init.sql
fi
/usr/bin/mysqld --skip-log-error --port=3306
