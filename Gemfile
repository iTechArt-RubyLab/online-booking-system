# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'

gem 'rails', '~> 6.1.4'

gem 'rspec'

gem 'rubocop'

gem 'pg'

gem 'pry'

gem 'puma', '~> 5.0'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false
# Use date_validator gem for validating dates
gem 'date_validator', '~> 0.12.0'
# Use validate_url gem for validating urls
gem 'validate_url', '~> 1.0.13'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  # Use rubocop to lint your code
  gem 'rubocop-rails', '~> 2.13', '>= 2.13.2'
  gem 'rubocop-rspec', '~> 2.7'
  # Use faker to generate test data
  gem 'faker', '~> 2.19'
end
