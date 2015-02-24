FROM ruby:2.2.0

MAINTAINER Andre Helberg  Alecia Bester

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV RAILS_VERSION 4.2.0

RUN gem install rails --version "$RAILS_VERSION"

RUN mkdir ~/.ssh
ADD rails/ssh/* /root/.ssh/

RUN bundle config --global frozen 1


RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY rails/Gemfile /usr/src/app/
COPY rails/Gemfile.lock /usr/src/app/
RUN bundle install

COPY rails/ /usr/src/app

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]


