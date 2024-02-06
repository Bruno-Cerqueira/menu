FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    apt-utils \
    libpq-dev \
    nodejs \
    postgresql-client

WORKDIR /menu/app

RUN gem install bundler:2.3.14

COPY Gemfile* ./

RUN bundle install

ADD . /menu/app

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]