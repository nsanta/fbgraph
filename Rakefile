require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('fbgraph', '0.1.4') do |p|
  p.description    = "A Gem for Facebook Open Graph API"
  p.url            = "http://github.com/nsanta/fbgraph"
  p.author         = "Nicolas Santa"
  p.email          = "nicolas55ar@gmail.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = ['echoe', 'rspec']
  p.runtime_dependencies = ['oauth2' , 'json', 'hashie' , 'rest-client']
end

Spec::Rake::SpecTask.new(:rspec) do |t|
  t.spec_files = FileList[File.join(File.dirname(__FILE__), 'specs', '**', '*_spec.rb')]
end
