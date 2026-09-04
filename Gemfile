# frozen_string_literal: true

source 'https://rubygems.org'

gem 'rails', '>= 7.1', '< 9'

gem 'haml-rails', '>= 2.0'
gem 'sass-rails', '>= 5'

gem 'cancancan', '>= 3.3'

gem 'simple_form', '>= 5.1'

gem 'importmap-rails', '>= 1.2'
gem 'stimulus-rails', '~> 1.3'
gem 'turbo-rails', '~> 2.0'

gem 'kaminari', '>= 1.2.1'

# No longer a default gem as of Ruby 4.0 - the controller's `item_option`
# builds plain OpenStructs for the record-picker dropdown.
gem 'ostruct'

group :development, :test do
  gem 'devise', '>= 4.8'
  gem 'faker', '~> 3'
  gem 'sqlite3', '~> 2.1'
end

group :development do
  gem 'factory_bot_rails', '~> 6.4'
  gem 'puma'
  gem 'rubocop', '~> 1.6', require: false
  gem 'rubocop-rails', '~> 2.25', require: false
  gem 'rubocop-rspec', '~> 3.0', require: false
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.1'
  gem 'rspec-html-matchers', '>= 0.9.4'
  gem 'rspec-rails', '~> 7.0'
  gem 'shoulda-matchers', '~> 6.0'
  gem 'simplecov', '>= 0.21.2', '< 1'
end
