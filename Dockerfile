FROM ruby
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p /sample_app
WORKDIR /sample_app
RUN gem install bundler
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install --without production
ADD . /sample_app
