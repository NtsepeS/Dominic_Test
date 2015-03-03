FROM nginx
MAINTAINER Pieter van der Merwe Andre Helberg

RUN rm -rf /usr/share/nginx/html
COPY rails/public /usr/share/nginx/html
COPY config/deploy/nginx.conf /etc/nginx/conf.d/default.conf