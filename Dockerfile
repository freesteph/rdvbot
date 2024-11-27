FROM ruby:3-slim

EXPOSE 9292

WORKDIR /app

RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential
COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . ./

CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0"]
