FROM phusion/baseimage
MAINTAINER Andre Helberg Pieter van der Merwe

# ========================================
# Install system dependencies
# ========================================
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-add-repository ppa:nginx/stable
RUN apt-get update && apt-get dist-upgrade -qq -y
RUN apt-get install -qq -y ruby-switch ruby2.2 \
  build-essential ruby2.2-dev libpq-dev \
  nodejs git nginx npm

RUN npm install -g npm@latest
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g bower ember-cli

RUN ruby-switch --set ruby2.2

# Update Rubygems and install a couple of system-wide gems.
RUN gem update --system --no-rdoc --no-ri
RUN gem update --no-rdoc --no-ri
RUN gem install --no-rdoc --no-ri bundler sass

# ========================================
# System admin
# ========================================

# Create user
RUN adduser --system --group cops-api

# ========================================
# App specific dependancies
# ========================================

# Install Frontend dependancies
# *************************

# Make sure bower uses https instead of ssh
RUN git config --global url."https://".insteadOf git://

COPY ./ember/package.json /srv/cops-frontend/package.json
COPY ./ember/bower.json /srv/cops-frontend/bower.json

RUN cd /srv/cops-frontend && \
  npm install

RUN cd /srv/cops-frontend && \
  bower --allow-root install

# Install Dependancies for Backend
# ******************************
COPY ./rails/Gemfile /srv/cops-api/Gemfile
COPY ./rails/Gemfile.lock /srv/cops-api/Gemfile.lock
RUN chown -R cops-api:cops-api /srv/cops-api
RUN cd /srv/cops-api && \
  /sbin/setuser cops-api bundle install \
    --deployment \
    --without development:test



# ========================================
# Rails API
# ========================================

# Install the app
COPY ./rails /srv/cops-api
RUN chown -R cops-api:cops-api /srv/cops-api

# Setup runit to run the app
RUN mkdir /etc/service/cops-api
ADD config/deploy/cops-api.sh /etc/service/cops-api/run



# ========================================
# Ember frontend
# ========================================

# Install the app
COPY ./ember /srv/cops-frontend

RUN cd /srv/cops-frontend && \
  ember build

RUN chown -R www-data:www-data /srv/cops-frontend/dist


# ========================================
# NGINX
# ========================================

# Don't spawn a daemon
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Add startup script for nginx
RUN mkdir /etc/service/nginx
ADD config/deploy/nginx.sh /etc/service/nginx/run

# Add default nginx config
RUN rm -f /etc/nginx/sites-enabled/default
COPY config/deploy/nginx.conf /etc/nginx/sites-enabled/cops


# ========================================
# Clean up afterwards.
# ========================================

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# ========================================
# Configure the environment for the app to run in.
# ========================================

ENV RAILS_ENV production
EXPOSE 80

# ========================================
# Start insecure ssh
# ========================================

# RUN /usr/sbin/enable_insecure_key
# RUN rm -f /etc/service/sshd/down

