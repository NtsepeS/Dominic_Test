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
RUN adduser --system --group cops

# ========================================
# App specific dependancies
# ========================================

# Install Frontend dependancies
# *************************

# Make sure bower uses https instead of ssh
RUN git config --global url."https://".insteadOf git://

COPY ./ember/package.json /srv/cops/ember/package.json
COPY ./ember/bower.json /srv/cops/ember/bower.json

RUN cd /srv/cops/ember && \
  npm install

RUN cd /srv/cops/ember && \
  bower --allow-root install

# Install Dependancies for Backend
# ******************************
COPY ./rails/Gemfile /srv/cops/rails/Gemfile
COPY ./rails/Gemfile.lock /srv/cops/rails/Gemfile.lock
RUN chown -R cops:cops /srv/cops
RUN cd /srv/cops/rails && \
  /sbin/setuser cops bundle install \
    --deployment \
    --without development:test



# ========================================
# Rails API
# ========================================

# Install the app
COPY . /srv/cops
RUN chown -R cops:cops /srv/cops

# Setup runit to run the app
RUN mkdir /etc/service/cops
ADD config/deploy/cops.sh /etc/service/cops/run



# ========================================
# Ember frontend
# ========================================


RUN cd /srv/cops/ember && \
  ember build

RUN chown -R www-data:www-data /srv/cops/ember/dist


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

