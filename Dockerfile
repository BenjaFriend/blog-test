FROM jekyll/jekyll

# Copy the gems that we need from the environment
COPY --chown=jekyll:jekyll Gemfile .
COPY --chown=jekyll:jekyll Gemfile.lock .

# Run 'install' so that we update bundler
RUN gem install bundler
RUN bundle config set clean 'true'

# Run the server on 4000
CMD ["jekyll", "serve"]