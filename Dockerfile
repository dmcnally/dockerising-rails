FROM ruby:2.4.1-slim

RUN apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends \
       postgresql-client \
       nodejs \
       libgmp-dev \
       libpq-dev \
       build-essential \
       patch \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
ENV GEM_HOME /rubygems
ENV BUNDLE_PATH /rubygems

ADD . $app

CMD bash