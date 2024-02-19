# syntax=docker/dockerfile:1

ARG CODE_VERSION=3.1.2
FROM ruby:${CODE_VERSION}

LABEL version="0.1"
LABEL description="Menu project to practice docker \
and rails"

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    apt-utils \
    libpq-dev \
    nodejs \
    postgresql-client

ENV BASEDIR=/menu

WORKDIR ${BASEDIR}

RUN gem install bundler:2.3.14

COPY Gemfile* ${BASEDIR}

RUN bundle install

ADD . ${BASEDIR}

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]