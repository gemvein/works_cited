# frozen_string_literal: true

module WorksCited
  # WorksCited Engine
  class Engine < Rails::Engine
    isolate_namespace WorksCited
    engine_name 'works_cited'

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
