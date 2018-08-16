FROM ruby:2.5.0

# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get update -qq
RUN apt-get install -y build-essential 
RUN apt-get install -y libpq-dev
RUN apt-get install -y nodejs

# ワーキングディレクトリの設定
RUN mkdir /rails-charts-test
WORKDIR /rails-charts-test

# gemfileを追加する
ADD Gemfile /rails-charts-test/Gemfile
ADD Gemfile.lock /rails-charts-test/Gemfile.lock

# gemfileのinstall
RUN bundle install
ADD . /rails-charts-test

ENV LANG C.UTF-8
