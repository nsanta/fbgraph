require 'rubygems'
require 'bundler/setup'
#require File.dirname(__FILE__) + "/lib/fbgraph.rb"
require 'rake'
require 'rspec'
require 'rspec/core/rake_task'
require 'rcov'

#$LOAD_PATH.unshift "/Users/technicalpickles/code/active/jeweler/lib"
begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "fbgraph"
    s.description = "A Gem for Facebook Open Graph API"
    s.summary = "A Gem for Facebook Open Graph API"
    s.homepage = "http://github.com/nsanta/fbgraph"
    s.author         = "Nicolas Santa"
    s.email          = "nicolas55ar@gmail.com"
    s.add_bundler_dependencies
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end


spec_files = FileList[File.join(File.dirname(__FILE__), 'specs', '**', '*_spec.rb')]

desc  "Run all specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./specs/**/*_spec.rb"
#  t.rcov = true
#  t.rcov_opts = t.rcov_opts = ['--exclude', 'spec']
end

