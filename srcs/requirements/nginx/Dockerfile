ROM alpine:3.16

RUN apk -U upgrade\
	&& apk add --no-cache nginx

COPY ./conf /etc/nginx/nginx.conf

COPY ./tools/certificate.pem	/etc/nginx/certificate.pem
COPY ./tools/private.key		/etc/nginx/private.key

EXPOSE 443

CMD	["nginx", "-g", "daemon off;"]