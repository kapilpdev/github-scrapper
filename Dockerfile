# Use the official Ruby Alpine image as the base
FROM ruby:3.2.2-alpine

# Install dependencies
RUN apk update && apk add --no-cache \
    build-base \
    nodejs-current \
    yarn \
    postgresql-dev \
    tzdata

# Set the working directory in the container
WORKDIR /app

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

# Copy the Rails application code
COPY . .

# Precompile assets
RUN bundle exec rake assets:precompile

# Expose port 3000 (adjust if your Rails app runs on a different port)
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
