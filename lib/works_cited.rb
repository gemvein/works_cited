# frozen_string_literal: true

# WorksCited Module
module WorksCited
  require 'active_record/railtie'
  require 'action_controller/railtie'
  require 'action_view/railtie'
  require 'sprockets/railtie'

  require 'works_cited/configuration'
  require 'works_cited/engine'
  require 'works_cited/railtie'
  require 'works_cited/version'

  require 'works_cited/mixins/has_works_cited'
  require 'works_cited/extensions/time'

  require 'haml-rails'
  require 'sass-rails'
  require 'vanilla_nested'
  require 'cancancan'
  require 'simple_form'
  require 'kaminari'
end

ActiveRecord::Base.extend WorksCited::Mixins::HasWorksCited
