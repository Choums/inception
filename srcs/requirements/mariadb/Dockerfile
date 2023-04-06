FROM alpine:3.16

RUN	apk -U upgrade\
	&& apk add --no-cache mariadb mariadb-client \
	&& rm -rf /var/cache/apk/*


EXPOSE 3306

#RUN mysql_install_db --user=me
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY ./tools/init.sql /init.sql

COPY ./tools/entrypoint.sh	/entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]