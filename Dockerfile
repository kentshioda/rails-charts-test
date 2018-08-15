FROM ruby:2.5.0

# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get update -qq
RUN apt-get install -y build-essential 
RUN apt-get install -y libpq-dev
RUN apt-get install -y nodejs

# ワーキングディレクトリの設定
RUN mkdir /homework
WORKDIR /homework

# gemfileを追加する
ADD Gemfile /homework/Gemfile
ADD Gemfile.lock /homework/Gemfile.lock

# gemfileのinstall
RUN bundle install
ADD . /homework

ENV LANG C.UTF-8
