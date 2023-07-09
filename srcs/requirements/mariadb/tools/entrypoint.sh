#!/bin/sh

# tail -f
if [ ! -d "/var/lib/mysql/wordpress" ]; then
    /usr/bin/mysqld --user=mysql --bootstrap < /init.sql
fi

/usr/bin/mysqld --skip-log-error --port=3306

