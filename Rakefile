require 'rubygems'
require 'bundler/setup'
#require File.dirname(__FILE__) + "/lib/fbgraph.rb"
require 'rake'
require 'spec'
require 'spec/rake/spectask'

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
    Bundler.environment.dependencies.to_set.collect { |g| s.add_runtime_dependency g.name, " #{g.send(:requirement).to_s}" }
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end


require 'spec/rake/spectask'

spec_files = FileList[File.join(File.dirname(__FILE__), 'specs', '**', '*_spec.rb')]

desc "Run specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = spec_files
  t.spec_opts = ["-c"]
end
