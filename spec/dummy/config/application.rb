# frozen_string_literal: true

require_relative 'boot'

# This dummy app renders real views/controllers and uses Devise's
# mailer-dependent modules (recoverable), but has no need for
# ActiveStorage/ActionCable/ActionMailbox/ActionText - trimmed to the
# railties actually exercised instead of the full `rails/all`.
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require 'works_cited'

module Dummy
  # Our dummy application
  class Application < Rails::Application
    config.load_defaults 8.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
