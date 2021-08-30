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
  gem 'juwelier', '~> 2.1.0'
  gem 'rdoc', '~> 3.12'
  gem 'shoulda', '>= 0'
  gem 'simplecov', '>= 0'
  gem 'rubocop', '>=0'
  gem 'rubocop-rails', '>=0'
  gem 'rubocop-rspec', '>=0'
  gem 'factory_bot_rails', '>=5.1', '<6'
  gem 'faker', '>=0'
end

# Run against this stable release
group :development, :test do
  gem 'database_cleaner', '>=1.8', '<2'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'shoulda-matchers', '>=4.3', '<5'
  gem 'sqlite3', '>= 1.4.2', '< 2'
  gem 'capybara', '>= 3.35', '< 4'
end