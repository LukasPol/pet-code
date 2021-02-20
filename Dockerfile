FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y libpq-dev

RUN mkdir /petlove
WORKDIR /petlove
COPY Gemfile /petlove/Gemfile
COPY Gemfile.lock /petlove/Gemfile.lock

##
RUN gem install bundler:2.0.2
RUN bundle install
COPY . /petlove

## Add Endpoint
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000