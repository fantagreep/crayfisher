FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /crayfish
WORKDIR /crayfish
COPY Gemfile /crayfish/Gemfile
COPY Gemfile.lock /crayfish/Gemfile.lock
RUN bundle install
COPY . /crayfish

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

RUN echo nameserver 8.8.8.8 >> /etc/resolv.conf
RUN echo nameserver 8.8.4.4 >> /etc/resolv.conf

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn
