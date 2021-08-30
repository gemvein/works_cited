# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
require 'juwelier'
Juwelier::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "works_cited"
  gem.homepage = "https://gemvein.com/museum/cases/works_cited"
  gem.metadata = { source_code_uri: "http://github.com/gemvein/works_cited" }
  gem.license = "MIT"
  gem.summary = %Q{Helper to generate list of Works Cited}
  gem.description = %Q{Works cited allows you to add a list of the works cited in ActiveRecord objects, to be formatted by a helper that can be added to relevant pages to format the citations like a bibliography.}
  gem.email = "loren.lundgren@gmail.com"
  gem.authors = ["Loren Lundgren"]

  # dependencies defined in Gemfile
end
Juwelier::RubygemsDotOrgTasks.new
require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['test'].execute
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "works_cited #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task default: :test
