# syntax=docker/dockerfile:1

FROM ruby:3.1.2

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