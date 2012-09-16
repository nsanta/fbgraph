# encoding: utf-8
#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake'

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'specs/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  require File.expand_path('../lib/fbgraph/version', __FILE__)
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = "SanitizeEmail #{FBGraph::VERSION}"
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Bundler::GemHelper.install_tasks
