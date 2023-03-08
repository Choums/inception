FROM alpine:3.16

RUN	apk -U upgrade
	&& add --no-cache mariadb mariadb-client && rm -rf /var/cache/apk/*

COPY

EXPOSE 3306

ENTRYPOINT ["./tools/build.sh"]