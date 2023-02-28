FROM nginx:alpine

WORKDIR ./ ./nginx

COPY ./conf ./nginx/conf

RUN apk -U upgrade
	&& apk add nginx

EXPOSE 9000

EXPOSE 443