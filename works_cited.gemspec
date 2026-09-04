# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'works_cited/version'

Gem::Specification.new do |s|
  s.name = 'works_cited'
  s.version = WorksCited::VERSION
  s.required_ruby_version = '>= 3.2'

  s.authors = ['Loren Lundgren']
  s.email = 'loren.lundgren@gmail.com'
  s.summary = 'Helper to generate a list of Works Cited'
  s.description = 'Works Cited allows you to add a list of the works cited in ActiveRecord objects, '\
                   'to be formatted by a helper that can be added to relevant pages to format the '\
                   'citations like a bibliography.'
  s.homepage = 'https://gemvein.com/museum/cases/works_cited'
  s.license = 'MIT'

  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(spec/dummy/db/(development|test)\.sqlite3|\.idea/)})
  end
  s.extra_rdoc_files = %w[LICENSE.txt README.md]
  s.require_paths = ['lib']

  s.add_runtime_dependency 'cancancan', '>= 3.3'
  s.add_runtime_dependency 'haml-rails', '>= 2.0'
  s.add_runtime_dependency 'importmap-rails', '~> 2.0'
  s.add_runtime_dependency 'kaminari', '>= 1.2.1'
  s.add_runtime_dependency 'ostruct'
  s.add_runtime_dependency 'rails', '>= 7.1', '< 9'
  s.add_runtime_dependency 'sass-rails', '>= 5'
  s.add_runtime_dependency 'simple_form', '>= 5.1'
  s.add_runtime_dependency 'stimulus-rails', '~> 1.3'
  s.add_runtime_dependency 'turbo-rails', '~> 2.0'

  s.add_development_dependency 'database_cleaner-active_record', '~> 2.1'
  s.add_development_dependency 'devise', '>= 4.8'
  s.add_development_dependency 'factory_bot_rails', '~> 6.4'
  s.add_development_dependency 'faker', '~> 3'
  s.add_development_dependency 'puma'
  s.add_development_dependency 'rspec-html-matchers', '>= 0.9.4'
  s.add_development_dependency 'rspec-rails', '~> 7.0'
  s.add_development_dependency 'rubocop', '~> 1.6'
  s.add_development_dependency 'rubocop-rails', '~> 2.25'
  s.add_development_dependency 'rubocop-rspec', '~> 3.0'
  s.add_development_dependency 'shoulda-matchers', '~> 6.0'
  s.add_development_dependency 'simplecov', '~> 0.22'
  s.add_development_dependency 'sqlite3', '~> 2.1'
end
