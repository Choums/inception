FROM alpine:3.16

RUN apk -U upgrade\
	&& apk add nginx

COPY ./conf /etc/nginx/nginx.conf

COPY	./tools/private.key		/etc/private/certificate.pem
COPY	./tools/certificate.pem	/etc/certs/private.key

EXPOSE 443

CMD	["nginx", "-g", "daemon off;"]