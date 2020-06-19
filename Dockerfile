FROM ruby:2.5.1

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /lesson_docker

WORKDIR /lesson_docker

ADD Gemfile /lesson_docker/Gemfile
ADD Gemfile.lock /lesson_docker/Gemfile.lock
RUN rm Gemfile.lock


RUN bundle install

ADD . /lesson_docker