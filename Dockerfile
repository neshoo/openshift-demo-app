FROM alpine:latest

USER root

RUN apk update && \
    apk add nginx && \
    chown -R nginx:www-data /var/lib/nginx

WORKDIR /etc/nginx
COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/index.html /usr/share/nginx/html/index.html

EXPOSE 8080
CMD ["/usr/sbin/nginx"]