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
    %w(activesupport hashie oauth2 json rest-client).each { |g| s.add_runtime_dependency g  }
    %w(rake rspec rcov bundler fakeweb jeweler echoe redgreen).each { |g| s.add_development_dependency g }
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

