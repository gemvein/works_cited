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
    initializer 'works_cited.extend_active_record' do
      ActiveSupport.on_load :active_record do
        extend WorksCited::Mixins::HasWorksCited
      end
    end
    initializer 'works_cited.assets.precompile' do |app|
      controllers = Dir.glob(Engine.root.join('app/javascript/controllers/works_cited/*.js'))
                       .map { |path| "controllers/works_cited/#{File.basename(path)}" }
      app.config.assets.precompile += %w[works_cited/application.css works_cited/application.js] + controllers
    end
    initializer 'works_cited.importmap', before: 'importmap' do |app|
      if app.config.respond_to?(:importmap)
        app.config.importmap.paths << Engine.root.join('config/importmap.rb')
        app.config.importmap.cache_sweepers << Engine.root.join('app/javascript')
      end
    end
    initializer 'works_cited.assets', before: 'importmap.assets' do |app|
      app.config.assets.paths << Engine.root.join('app/javascript') if app.config.respond_to?(:assets)
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
