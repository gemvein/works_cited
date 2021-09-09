# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: works_cited 0.1.7 ruby lib

Gem::Specification.new do |s|
  s.name = "works_cited".freeze
  s.version = "0.1.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "source_code_uri" => "http://github.com/gemvein/works_cited" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Loren Lundgren".freeze]
  s.date = "2021-09-09"
  s.description = "Works cited allows you to add a list of the works cited in ActiveRecord objects, to be formatted by a helper that can be added to relevant pages to format the citations like a bibliography.".freeze
  s.email = "loren.lundgren@gmail.com".freeze
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rubocop.yml",
    ".ruby-gemset",
    ".ruby-version",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "app/assets/javascripts/works_cited/application.js",
    "app/assets/stylesheets/works_cited/application.scss",
    "app/controllers/works_cited/citations_controller.rb",
    "app/helpers/works_cited/application_helper.rb",
    "app/models/works_cited/citation.rb",
    "app/models/works_cited/contributor.rb",
    "app/views/works_cited/citation_types/citation/_book.html.haml",
    "app/views/works_cited/citation_types/citation/_default.html.haml",
    "app/views/works_cited/citation_types/citation/_electronic.html.haml",
    "app/views/works_cited/citation_types/citation/_email.html.haml",
    "app/views/works_cited/citation_types/citation/_interview.html.haml",
    "app/views/works_cited/citation_types/citation/_periodical.html.haml",
    "app/views/works_cited/citation_types/citation/_tweet.html.haml",
    "app/views/works_cited/citation_types/fields/_book.html.haml",
    "app/views/works_cited/citation_types/fields/_default.html.haml",
    "app/views/works_cited/citation_types/fields/_electronic.html.haml",
    "app/views/works_cited/citation_types/fields/_email.html.haml",
    "app/views/works_cited/citation_types/fields/_interview.html.haml",
    "app/views/works_cited/citation_types/fields/_periodical.html.haml",
    "app/views/works_cited/citation_types/fields/_tweet.html.haml",
    "app/views/works_cited/citations/_form.html.haml",
    "app/views/works_cited/citations/_list.html.haml",
    "app/views/works_cited/citations/edit.html.haml",
    "app/views/works_cited/citations/index.html.haml",
    "app/views/works_cited/citations/new.html.haml",
    "app/views/works_cited/citations/preview.html.haml",
    "app/views/works_cited/citations/show.html.haml",
    "app/views/works_cited/contributors/_fields.html.haml",
    "config/initializers/simple_form.rb",
    "config/locales/simple_form.en.yml",
    "config/routes.rb",
    "db/migrate/20210830165845_create_works_cited_citations.works_cited.rb",
    "db/migrate/20210831013102_create_works_cited_contributors.works_cited.rb",
    "lib/tasks/works_cited_tasks.rake",
    "lib/templates/haml/scaffold/_form.html.haml",
    "lib/works_cited.rb",
    "lib/works_cited/configuration.rb",
    "lib/works_cited/engine.rb",
    "lib/works_cited/extensions/time.rb",
    "lib/works_cited/mixins/has_works_cited.rb",
    "lib/works_cited/railtie.rb",
    "lib/works_cited/version.rb",
    "spec/dummy/Rakefile",
    "spec/dummy/app/assets/config/manifest.js",
    "spec/dummy/app/assets/images/.keep",
    "spec/dummy/app/assets/stylesheets/application.css",
    "spec/dummy/app/assets/stylesheets/doodads.css",
    "spec/dummy/app/assets/stylesheets/scaffold.css",
    "spec/dummy/app/assets/stylesheets/scaffolds.scss",
    "spec/dummy/app/assets/stylesheets/things.scss",
    "spec/dummy/app/channels/application_cable/channel.rb",
    "spec/dummy/app/channels/application_cable/connection.rb",
    "spec/dummy/app/controllers/application_controller.rb",
    "spec/dummy/app/controllers/concerns/.keep",
    "spec/dummy/app/controllers/doodads_controller.rb",
    "spec/dummy/app/controllers/things_controller.rb",
    "spec/dummy/app/javascript/packs/application.js",
    "spec/dummy/app/jobs/application_job.rb",
    "spec/dummy/app/mailers/application_mailer.rb",
    "spec/dummy/app/models/ability.rb",
    "spec/dummy/app/models/application_record.rb",
    "spec/dummy/app/models/concerns/.keep",
    "spec/dummy/app/models/doodad.rb",
    "spec/dummy/app/models/thing.rb",
    "spec/dummy/app/models/user.rb",
    "spec/dummy/app/views/doodads/_form.html.haml",
    "spec/dummy/app/views/doodads/edit.html.haml",
    "spec/dummy/app/views/doodads/index.html.haml",
    "spec/dummy/app/views/doodads/new.html.haml",
    "spec/dummy/app/views/doodads/show.html.haml",
    "spec/dummy/app/views/layouts/application.html.erb",
    "spec/dummy/app/views/layouts/mailer.html.erb",
    "spec/dummy/app/views/layouts/mailer.text.erb",
    "spec/dummy/app/views/things/_form.html.haml",
    "spec/dummy/app/views/things/edit.html.haml",
    "spec/dummy/app/views/things/index.html.haml",
    "spec/dummy/app/views/things/new.html.haml",
    "spec/dummy/app/views/things/show.html.haml",
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
    "spec/dummy/config/initializers/devise.rb",
    "spec/dummy/config/initializers/filter_parameter_logging.rb",
    "spec/dummy/config/initializers/inflections.rb",
    "spec/dummy/config/initializers/json.rb",
    "spec/dummy/config/initializers/mime_types.rb",
    "spec/dummy/config/initializers/permissions_policy.rb",
    "spec/dummy/config/initializers/works_cited.rb",
    "spec/dummy/config/initializers/wrap_parameters.rb",
    "spec/dummy/config/locales/devise.en.yml",
    "spec/dummy/config/locales/en.yml",
    "spec/dummy/config/puma.rb",
    "spec/dummy/config/routes.rb",
    "spec/dummy/config/storage.yml",
    "spec/dummy/db/development.sqlite3",
    "spec/dummy/db/migrate/20210830171235_create_doodads.rb",
    "spec/dummy/db/migrate/20210902150031_devise_create_users.rb",
    "spec/dummy/db/migrate/20210902202653_create_works_cited_citations.works_cited.rb",
    "spec/dummy/db/migrate/20210902202654_create_works_cited_contributors.works_cited.rb",
    "spec/dummy/db/migrate/20210907170207_create_things.rb",
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
    "spec/dummy/storage/.keep",
    "spec/dummy/tmp/.keep",
    "spec/dummy/tmp/development_secret.txt",
    "spec/dummy/tmp/pids/.keep",
    "spec/dummy/tmp/storage/.keep",
    "spec/factories/citations.rb",
    "spec/factories/contributors.rb",
    "spec/factories/doodads.rb",
    "spec/factories/users.rb",
    "spec/helpers/works_cited/works_cited_helper_spec.rb",
    "spec/models/doodad_spec.rb",
    "spec/models/thing_spec.rb",
    "spec/models/works_cited/citation_spec.rb",
    "spec/models/works_cited/contributor_spec.rb",
    "spec/rails_helper.rb",
    "spec/requests/works_cited/citations_spec.rb",
    "spec/routing/works_cited/citations_routing_spec.rb",
    "spec/spec_helper.rb",
    "spec/works_cited_spec.rb",
    "works_cited.gemspec"
  ]
  s.homepage = "https://gemvein.com/museum/cases/works_cited".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Helper to generate list of Works Cited".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 6", "< 7"])
    s.add_runtime_dependency(%q<haml-rails>.freeze, [">= 2.0", "< 3"])
    s.add_runtime_dependency(%q<sass-rails>.freeze, [">= 6", "< 7"])
    s.add_runtime_dependency(%q<cancancan>.freeze, [">= 3.3", "< 4"])
    s.add_runtime_dependency(%q<simple_form>.freeze, [">= 5.1", "< 6"])
    s.add_runtime_dependency(%q<vanilla_nested>.freeze, [">= 1.3", "< 2"])
    s.add_runtime_dependency(%q<kaminari>.freeze, [">= 1.2.1", "< 2"])
    s.add_development_dependency(%q<database_cleaner>.freeze, [">= 1.8", "< 2"])
    s.add_development_dependency(%q<devise>.freeze, [">= 4.8", "< 5"])
    s.add_development_dependency(%q<faker>.freeze, [">= 0"])
    s.add_development_dependency(%q<sqlite3>.freeze, [">= 1.4.2", "< 2"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 2", "< 3"])
    s.add_development_dependency(%q<factory_bot_rails>.freeze, [">= 5.1", "< 6"])
    s.add_development_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
    s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop-rails>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 6", "< 7"])
    s.add_dependency(%q<haml-rails>.freeze, [">= 2.0", "< 3"])
    s.add_dependency(%q<sass-rails>.freeze, [">= 6", "< 7"])
    s.add_dependency(%q<cancancan>.freeze, [">= 3.3", "< 4"])
    s.add_dependency(%q<simple_form>.freeze, [">= 5.1", "< 6"])
    s.add_dependency(%q<vanilla_nested>.freeze, [">= 1.3", "< 2"])
    s.add_dependency(%q<kaminari>.freeze, [">= 1.2.1", "< 2"])
    s.add_dependency(%q<database_cleaner>.freeze, [">= 1.8", "< 2"])
    s.add_dependency(%q<devise>.freeze, [">= 4.8", "< 5"])
    s.add_dependency(%q<faker>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 1.4.2", "< 2"])
    s.add_dependency(%q<bundler>.freeze, [">= 2", "< 3"])
    s.add_dependency(%q<factory_bot_rails>.freeze, [">= 5.1", "< 6"])
    s.add_dependency(%q<juwelier>.freeze, ["~> 2.1.0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop-rails>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
  end
end

