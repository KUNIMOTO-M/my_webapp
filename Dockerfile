FROM ruby:2.7.0

RUN  apt-get update -qq && \
    apt-get install -y build-essential \
                      nodejs

RUN mkdir /webapp
WORKDIR /webapp

ADD Gemfile /webapp/Gemfile
ADD Gemfile.lock /webapp/Gemfile.lock

RUN bundle install

ADD . /weabapp

RUN mkdir -p tmp/sockets