FROM ruby:2.7.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /nekoquest
WORKDIR /nekoquest
COPY Gemfile /nekoquest/Gemfile
COPY Gemfile.lock /nekoquest/Gemfile.lock
RUN bundle install
COPY . /nekoquest
