require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('fbgraph', '0.0.9') do |p|
  p.description    = "A Gem for Facebook Open Graph API"
  p.url            = "http://github.com/nsanta/fbgraph"
  p.author         = "Nicolas Santa"
  p.email          = "nicolas55ar@gmail.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  # p.development_dependencies = ['oauth2' , 'json']
  p.runtime_dependencies = ['oauth2' , 'json', 'hashie']
end

Spec::Rake::SpecTask.new(:rspec) do |t|
  t.spec_files = FileList[File.join(File.dirname(__FILE__), 'specs', '**', '*_spec.rb')]
end
