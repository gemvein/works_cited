# frozen_string_literal: true

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  warn e.message
  warn 'Run `bundle install` to install missing gems'
  exit e.status_code
end
require 'rake'
require 'juwelier'
Juwelier::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = 'works_cited'
  gem.homepage = 'https://gemvein.com/museum/cases/works_cited'
  gem.metadata = { source_code_uri: 'http://github.com/gemvein/works_cited' }
  gem.license = 'MIT'
  gem.summary = %(Helper to generate list of Works Cited)
  gem.description = 'Works cited allows you to add a list of the works cited in ActiveRecord objects, '\
                    'to be formatted by a helper that can be added to relevant pages to format the '\
                    'citations like a bibliography.'
  gem.email = 'loren.lundgren@gmail.com'
  gem.authors = ['Loren Lundgren']

  # dependencies defined in Gemfile
end

Juwelier::RubygemsDotOrgTasks.new

desc 'Code coverage detail'
task :simplecov do
  ENV['COVERAGE'] = 'true'
  Rake::Task['test'].execute
end
