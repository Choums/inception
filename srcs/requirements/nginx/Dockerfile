FROM alpine:3.14

RUN apk -U upgrade\
	&& apk add --no-cache --update nginx

COPY ./conf /etc/nginx/nginx.conf

COPY ./tools/certificate.pem	/etc/nginx/certificate.pem
COPY ./tools/private.key		/etc/nginx/private.key

RUN chmod -R 777 /etc/nginx
RUN rm /etc/nginx/http.d/default.conf

EXPOSE 443

CMD	["nginx", "-g", "daemon off;"]