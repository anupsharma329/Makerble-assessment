FROM ruby:3.2

# Install OS dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Create app directory
WORKDIR /myapp

# Copy Gemfiles and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy rest of the application
COPY . .

# Expose port 3000
EXPOSE 3000

# Run Rails server
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0 -p 3000"]
