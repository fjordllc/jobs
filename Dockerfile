FROM ruby:2.6.6
ENV LANG C.UTF-8
ENV RAILS_ENV production

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn
RUN gem install bundler -v 2.1.4

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ADD package.json package.json
ADD yarn.lock yarn.lock
RUN yarn install

WORKDIR /app
ADD . /app

RUN SECRET_KEY_BASE=dummy bin/rails assets:precompile

ENV PORT 3000
EXPOSE 3000

CMD bin/rails server
