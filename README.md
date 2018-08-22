# what?

Amazon，楽天，ヤフー，ゾゾタウンを含むtweet数推移チャート

# data
2017/01/06~2017/01/09 間に呟かれたtweet: 2,860,669件

# how to built environment

1. `docker-compose build`
1. `docker-compose up -d`
1. `docker-compose run web bundle exec rake db:create`
1. `docker-compose run web bundle exec rails db:migrate`
1. `docker-compose run web bundle exec rails db:seed`
