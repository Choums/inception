FROM alpine:3.16

RUN	apk -U upgrade\
	&& apk add --no-cache mariadb mariadb-client

EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#RUN mysql_install_db --user=me
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY ./tools/init.sql /init.sql

COPY ./tools/entrypoint.sh	/entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]