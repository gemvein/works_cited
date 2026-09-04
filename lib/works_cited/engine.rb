# frozen_string_literal: true

module WorksCited
  # WorksCited Engine
  class Engine < Rails::Engine
    isolate_namespace WorksCited
    engine_name 'works_cited'

    initializer 'local_helper.action_controller' do
      ActiveSupport.on_load :action_controller do
        helper WorksCited::ApplicationHelper
      end
    end
    initializer 'works_cited.assets.precompile' do |app|
      app.config.assets.precompile += %w[works_cited/application.css works_cited/application.js vanilla_nested.js]
    end

    config.generators do |g|
      g.hidden_namespaces << 'test_unit' << 'erb'
      g.orm             :active_record
      g.template_engine :haml
      g.test_framework  :rspec, fixture: false
      g.integration_tool :rspec
      g.stylesheets     false
      g.javascripts     false
      g.view_specs      false
      g.helper_specs    false
    end

    def self.table_name_prefix
      'works_cited_'
    end
  end
end
