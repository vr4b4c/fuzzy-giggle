FROM ruby:2.6.1

RUN apt-get update -yqq && \
      apt-get remove cmdtest -yqq && \
      apt-get install -yqq --no-install-recommends \
      libcurl3-gnutls \
      apt-transport-https \
      ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
      nodejs \
      yarn

COPY Gemfile* /app/

WORKDIR /app

ENV BUNDLE_PATH /gems
RUN gem install bundler:2.1.4 && \
      bundle install

COPY package.json .
COPY yarn.lock .
RUN yarn

COPY . /app

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
