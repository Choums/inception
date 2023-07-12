FROM alpine:3.14

RUN	apk -U upgrade\
	&& apk add --no-cache mariadb mariadb-client

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld

#Allow remote connection
RUN sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/my.cnf.d/50-server.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# COPY ./tools/init.sql /init.sql

COPY ./tools/entrypoint.sh	/entrypoint.sh
RUN chmod +x /entrypoint.sh

USER mysql
ENTRYPOINT ["/entrypoint.sh"]
#/etc/my.cnf /etc/mysql/my.cnf ~/.my.cnf 