FROM alpine:3.16

RUN apk -U upgrade\
	&& apk add nginx

COPY ./conf /etc/nginx/nginx.conf

EXPOSE 443

CMD	["nginx", "-g", "daemon off;"]