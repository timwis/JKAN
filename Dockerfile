FROM ruby:3.1-bullseye

ENV GEM_HOME=/usr/gem
ENV PATH="$GEM_HOME/bin/:$PATH" 

RUN gem install bundler -v '2.4.3'
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /srv/jekyll
COPY Gemfile Gemfile.lock ./
RUN bundle install

CMD ["/bin/bash"]
