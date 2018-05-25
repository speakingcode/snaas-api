FROM ruby:2.5.1-alpine3.7

RUN apk add --update build-base postgresql-dev tzdata
RUN gem install rails -v '5.1.6'

WORKDIR /snaas
ADD Gemfile Gemfile.lock /snaas/
RUN bundle install

ADD . .
CMD ["puma"]
