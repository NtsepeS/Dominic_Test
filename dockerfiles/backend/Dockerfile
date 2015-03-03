FROM phusion/baseimage
MAINTAINER Andre Helberg Pieter van der Merwe

# Install system dependencies
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update && apt-get dist-upgrade -qq -y
RUN apt-get install -qq -y ruby-switch ruby2.1 \
  build-essential ruby2.1-dev libpq-dev \
  nodejs git
RUN ruby-switch --set ruby2.1

# Update Rubygems and install a couple of system-wide gems.
RUN gem update --system --no-rdoc --no-ri
RUN gem update --no-rdoc --no-ri
RUN gem install --no-rdoc --no-ri bundler

# Configure the environment for the app to run in.
ENV RAILS_ENV production
ENV PORT 5000
ENV SECRET_KEY_BASE aaaaaaaa

EXPOSE ${PORT}

# Setup runit to run the app
RUN mkdir /etc/service/cops-api
ADD config/deploy/cops-api.sh /etc/service/cops-api/run

# Install the app
RUN adduser --system --group cops-api
COPY ./rails /srv/cops-api
RUN chown -R cops-api:cops-api /srv/cops-api
RUN cd /srv/cops-api && \
  /sbin/setuser cops-api bundle install \
    --deployment \
    --without development:test

# Clean up afterwards.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN /usr/sbin/enable_insecure_key
RUN rm -f /etc/service/sshd/down

