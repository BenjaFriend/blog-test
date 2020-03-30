FROM jekyll/jekyll

# Copy the gems that we need from the environment
COPY Gemfile .
COPY Gemfile.lock .

# Run 'install' so that we update bundler
RUN gem install bundler
RUN bundle install --quiet --clean

# Run the server on 4000
CMD ["jekyll", "serve"]
