# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: works_cited 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "works_cited".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "source_code_uri" => "http://github.com/gemvein/works_cited" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Loren Lundgren".freeze]
  s.date = "2021-08-30"
  s.description = "Works cited allows you to add a list of the works cited in ActiveRecord objects, to be formatted by a helper that can be added to relevant pages to format the citations like a bibliography.".freeze
  s.email = "loren.lundgren@gmail.com".freeze
  s.executables = ["rails".freeze]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown",
    "README.md"
  ]
  s.files = [
    ".document",
    ".idea/works_cited.iml",
    ".rubocop.yml",
    ".ruby-gemset",
    ".ruby-version",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "MIT-LICENSE",
    "README.markdown",
    "README.md",
    "Rakefile",
    "VERSION",
    "app/models/works_cited/citation.rb",
    "app/models/works_cited/concerns/has_works_cited.rb",
    "bin/rails",
    "db/migrate/20210830165845_create_works_cited_citations.works_cited.rb",
    "lib/tasks/works_cited_tasks.rake",
    "lib/works_cited.rb",
    "lib/works_cited/configuration.rb",
    "lib/works_cited/engine.rb",
    "lib/works_cited/localization.rb",
    "lib/works_cited/railtie.rb",
    "lib/works_cited/ruby_version_check.rb",
    "lib/works_cited/version.rb",
    "spec/dummy/Rakefile",
    "spec/dummy/app/assets/config/manifest.js",
    "spec/dummy/app/assets/images/.keep",
    "spec/dummy/app/assets/stylesheets/application.css",
    "spec/dummy/app/assets/stylesheets/doodads.css",
    "spec/dummy/app/assets/stylesheets/scaffold.css",
    "spec/dummy/app/channels/application_cable/channel.rb",
    "spec/dummy/app/channels/application_cable/connection.rb",
    "spec/dummy/app/controllers/application_controller.rb",
    "spec/dummy/app/controllers/concerns/.keep",
    "spec/dummy/app/controllers/doodads_controller.rb",
    "spec/dummy/app/helpers/application_helper.rb",
    "spec/dummy/app/helpers/doodads_helper.rb",
    "spec/dummy/app/javascript/packs/application.js",
    "spec/dummy/app/jobs/application_job.rb",
    "spec/dummy/app/mailers/application_mailer.rb",
    "spec/dummy/app/models/application_record.rb",
    "spec/dummy/app/models/concerns/.keep",
    "spec/dummy/app/models/doodad.rb",
    "spec/dummy/app/views/doodads/_form.html.haml",
    "spec/dummy/app/views/doodads/edit.html.haml",
    "spec/dummy/app/views/doodads/index.html.haml",
    "spec/dummy/app/views/doodads/new.html.haml",
    "spec/dummy/app/views/doodads/show.html.haml",
    "spec/dummy/app/views/layouts/application.html.erb",
    "spec/dummy/app/views/layouts/mailer.html.erb",
    "spec/dummy/app/views/layouts/mailer.text.erb",
    "spec/dummy/bin/rails",
    "spec/dummy/bin/rake",
    "spec/dummy/bin/setup",
    "spec/dummy/config.ru",
    "spec/dummy/config/application.rb",
    "spec/dummy/config/boot.rb",
    "spec/dummy/config/cable.yml",
    "spec/dummy/config/database.yml",
    "spec/dummy/config/environment.rb",
    "spec/dummy/config/environments/development.rb",
    "spec/dummy/config/environments/production.rb",
    "spec/dummy/config/environments/test.rb",
    "spec/dummy/config/initializers/application_controller_renderer.rb",
    "spec/dummy/config/initializers/assets.rb",
    "spec/dummy/config/initializers/backtrace_silencers.rb",
    "spec/dummy/config/initializers/content_security_policy.rb",
    "spec/dummy/config/initializers/cookies_serializer.rb",
    "spec/dummy/config/initializers/filter_parameter_logging.rb",
    "spec/dummy/config/initializers/inflections.rb",
    "spec/dummy/config/initializers/json.rb",
    "spec/dummy/config/initializers/mime_types.rb",
    "spec/dummy/config/initializers/permissions_policy.rb",
    "spec/dummy/config/initializers/wrap_parameters.rb",
    "spec/dummy/config/locales/en.yml",
    "spec/dummy/config/puma.rb",
    "spec/dummy/config/routes.rb",
    "spec/dummy/config/storage.yml",
    "spec/dummy/db/development.sqlite3",
    "spec/dummy/db/migrate/20210830171235_create_doodads.rb",
    "spec/dummy/db/migrate/20210830221855_create_works_cited_citations.works_cited.rb",
    "spec/dummy/db/schema.rb",
    "spec/dummy/db/test.sqlite3",
    "spec/dummy/lib/assets/.keep",
    "spec/dummy/log/.keep",
    "spec/dummy/log/development.log",
    "spec/dummy/log/test.log",
    "spec/dummy/public/404.html",
    "spec/dummy/public/422.html",
    "spec/dummy/public/500.html",
    "spec/dummy/public/apple-touch-icon-precomposed.png",
    "spec/dummy/public/apple-touch-icon.png",
    "spec/dummy/public/favicon.ico",
    "spec/dummy/spec/factories/doodads.rb",
    "spec/dummy/spec/helpers/doodads_helper_spec.rb",
    "spec/dummy/spec/models/doodad_spec.rb",
    "spec/dummy/spec/requests/doodads_spec.rb",
    "spec/dummy/spec/routing/doodads_routing_spec.rb",
    "spec/dummy/spec/views/doodads/edit.html.haml_spec.rb",
    "spec/dummy/spec/views/doodads/index.html.haml_spec.rb",
    "spec/dummy/spec/views/doodads/new.html.haml_spec.rb",
    "spec/dummy/spec/views/doodads/show.html.haml_spec.rb",
    "spec/dummy/storage/.keep",
    "spec/dummy/tmp/.keep",
    "spec/dummy/tmp/development_secret.txt",
    "spec/dummy/tmp/pids/.keep",
    "spec/dummy/tmp/storage/.keep",
    "spec/factories/citations.rb",
    "spec/factories/doodads.rb",
    "spec/models/doodad_spec.rb",
    "spec/models/works_cited/citation_spec.rb",
    "spec/rails_helper.rb",
    "spec/spec_helper.rb",
    "spec/works_cited_spec.rb",
    "works_cited.gemspec"
  ]
  s.homepage = "https://gemvein.com/museum/cases/works_cited".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new("= 2.7.2".freeze)
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Helper to generate list of Works Cited".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 6", "< 7"])
    s.add_runtime_dependency(%q<haml-rails>.freeze, [">= 2.0", "< 3"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 2", "< 3"])
    s.add_development_dependency(%q<factory_bot_rails>.freeze, [">= 5.1", "< 6"])
    s.add_development_dependency(%q<faker>.freeze, [">= 0"])
    s.add_development_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
    s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop-rails>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<shoulda>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_development_dependency(%q<capybara>.freeze, [">= 3.35", "< 4"])
    s.add_development_dependency(%q<database_cleaner>.freeze, [">= 1.8", "< 2"])
    s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 5.0.0"])
    s.add_development_dependency(%q<shoulda-matchers>.freeze, [">= 4.3", "< 5"])
    s.add_development_dependency(%q<sqlite3>.freeze, [">= 1.4.2", "< 2"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 6", "< 7"])
    s.add_dependency(%q<haml-rails>.freeze, [">= 2.0", "< 3"])
    s.add_dependency(%q<bundler>.freeze, [">= 2", "< 3"])
    s.add_dependency(%q<factory_bot_rails>.freeze, [">= 5.1", "< 6"])
    s.add_dependency(%q<faker>.freeze, [">= 0"])
    s.add_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop-rails>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
    s.add_dependency(%q<shoulda>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<capybara>.freeze, [">= 3.35", "< 4"])
    s.add_dependency(%q<database_cleaner>.freeze, [">= 1.8", "< 2"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 5.0.0"])
    s.add_dependency(%q<shoulda-matchers>.freeze, [">= 4.3", "< 5"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 1.4.2", "< 2"])
  end
end
