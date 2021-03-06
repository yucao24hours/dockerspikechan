FROM ruby:2.5

RUN apt-get update && apt-get install -y nodejs mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/lib/mysql && touch /var/lib/mysql/mysql.sock
ADD ./containers/mysql/my.cnf /etc/

RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

COPY . /myapp

EXPOSE 3000
