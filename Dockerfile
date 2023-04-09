FROM ruby:3.1.1-slim

WORKDIR /usr/src/app

RUN apt-get update && \
  apt-get install ruby-full build-essential -y && \
  apt-get install libpq-dev -y &&\
  apt-get install git -y

COPY . .

RUN gem update --system
RUN gem install bundler:2.3.26

RUN bundle install

EXPOSE 3000

# RUN chmod +x rails-entrypoint.sh

# ENTRYPOINT [ "./rails-entrypoint.sh" ]

CMD ["rails", "server", "-b", "0.0.0.0"]
