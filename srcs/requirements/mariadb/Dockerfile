FROM alpine:3.16

RUN	apk -U upgrade\
	&& apk add --no-cache mariadb mariadb-client\
	&& rm -rf /var/cache/apk/*

COPY ./tools/entrypoint.sh	/entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD [ "mysql", "-u $MYSQL_USER" ]