# frozen_string_literal: true

source 'https://rubygems.org'
# Add dependencies required to use your gem here.
# Example:
#   gem 'activesupport', '>= 2.3.5'
gem 'rails', '>= 6', '< 7'

gem 'haml-rails', '>= 2.0', '< 3'

# Add dependencies to develop your gem here.
# Include everything needed to run rake, tests, features, etc.
group :development do
  gem 'bundler', '>= 2', '< 3'
  gem 'factory_bot_rails', '>=5.1', '<6'
  gem 'juwelier', '~> 2.1.0'
  gem 'rubocop', '>=0'
  gem 'rubocop-rails', '>=0'
  gem 'rubocop-rspec', '>=0'
  gem 'shoulda', '>= 0'
end

# Run against this stable release
# Run against this stable release
group :development, :test do
  gem 'capybara', '>= 3.35', '< 4'
  gem 'database_cleaner', '>=1.8', '<2'
  gem 'faker', '>=0'
  gem 'rspec-html-matchers', '>= 0'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'shoulda-matchers', '>=4.3', '<5'
  gem 'simplecov', '>= 0'
  gem 'sqlite3', '>= 1.4.2', '< 2'
end
