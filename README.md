# Pre-requisite

1. Install Ruby 3.2.2
2. Install Rails 7.0.6
3. Install postgres and setup local environment

# Setup

1. `bundle install`
2. Setup `database.yml`
3. `bundle exec rake db:create`
4. `bundle exec rake db:migrate`
5. Start Server - `bundle exec rails s`
6. Run Sidekiq - `bundle exec sidekiq`

# rspec

1. `bundle exec rspec`
