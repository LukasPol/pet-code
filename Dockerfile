FROM ruby:2.7.0

RUN apt-get update -qq && apt-get install -y libpq-dev postgresql-client

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