# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'
  
gem 'rails', '~> 6.1.4'

gem 'pg'

gem 'puma', '~> 5.0'

# Use tzinfo gem instead of tzinfo-data
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

# Use date_validator gem for validating dates
gem 'date_validator', '~> 0.12.0'

# Use validate_url gem for validating urls
gem 'validate_url', '~> 1.0.13'
# Use devise-token-auth gem for authentication
gem 'devise_token_auth', '~> 1.2'
# Use omniauth gem for authentication
gem 'omniauth', '~> 2.0'
gem 'omniauth-github', '~> 2.0'
# Use rack-cors gem for CORS support
gem 'rack-cors', '~> 1.1'

gem 'geocoder', '~> 1.3', '>= 1.3.7'
gem "sidekiq"

gem 'will_paginate', '~> 3.3'

gem 'airbrake-ruby', '~> 6.0', '>= 6.0.2'

gem 'airbrake', '~> 13.0'

gem 'figaro'

gem 'active_storage_validations'

gem 'mini_magick', '>= 4.9.5'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec'
  gem 'rubocop'
  gem 'pry'
  gem 'pry-nav'
  # Use rubocop to lint your code
  gem 'rspec-rails'
  gem 'rubocop-rails', '~> 2.13', '>= 2.13.2'
  gem 'rubocop-rspec', '~> 2.7'
  # Use faker to generate test data
  gem 'faker', '~> 2.19'
  # Use database_cleaner gem to clean up your database
  gem 'database_cleaner'
  # Use factory_bot to generate test data
  gem 'factory_bot_rails'
  # Use shoulda-matchers gem to test your models
  gem 'shoulda-matchers', '~> 5.0'
  # Use simplecov gem to generate test coverage reports
  gem 'simplecov', '~> 0.21.2'
  # Use annotate to add comments to your code
  gem 'annotate', '~> 3.1', '>= 3.1.1'
  gem 'elasticsearch-rails', '~> 7.2'
  gem 'elasticsearch-model', '~> 7.2'
end
