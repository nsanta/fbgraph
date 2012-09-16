# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fbgraph/version', __FILE__)

Gem::Specification.new do |s|
  s.name = "fbgraph"
  s.version = FBGraph::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nicolas Santa"]
  s.date = "2012-04-27"
  s.description = "A Gem for Facebook Open Graph API"
  s.email = "nicolas55ar@gmail.com"
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})

  s.extra_rdoc_files = [
    "README",
  ]
  s.files = [
    ".bundle/config",
    "Gemfile",
    "Manifest",
    "README",
    "README.textile",
    "Rakefile",
    "TODO.list",
    "fbgraph.gemspec",
    "lib/fbgraph.rb",
    "lib/fbgraph/authorization.rb",
    "lib/fbgraph/base.rb",
    "lib/fbgraph/cacert.pem",
    "lib/fbgraph/canvas.rb",
    "lib/fbgraph/client.rb",
    "lib/fbgraph/fql.rb",
    "lib/fbgraph/logger.rb",
    "lib/fbgraph/realtime.rb",
    "lib/fbgraph/result.rb",
    "lib/fbgraph/search.rb",
    "lib/fbgraph/selection.rb",
    "lib/fbgraph/timeline.rb",
    "specs/lib/fbauth/authorization_spec.rb",
    "specs/lib/fbauth/base_spec.rb",
    "specs/lib/fbauth/canvas_spec.rb",
    "specs/lib/fbauth/client_spec.rb",
    "specs/lib/fbauth/realtime_spec.rb",
    "specs/lib/fbauth/search_spec.rb",
    "specs/lib/fbauth/selection_spec.rb",
    "specs/spec_helper.rb"
  ]
  s.homepage = "http://github.com/nsanta/fbgraph"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.21"
  s.summary = "A Gem for Facebook Open Graph API"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<hashie>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<oauth2>, [">= 0.5.0"])
      s.add_runtime_dependency(%q<faraday>, [">= 0.7.5"])
      s.add_runtime_dependency(%q<json>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<rest-client>, [">= 0"])
      s.add_runtime_dependency(%q<i18n>, [">= 0"])
      s.add_development_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_development_dependency(%q<bundler>, ["> 1.0.0"])
      s.add_development_dependency(%q<fakeweb>, ["~> 1.3.0"])
      s.add_development_dependency(%q<rspec>, [">= 2.6.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 3.9.0"])
      s.add_development_dependency(%q<redgreen>, ["~> 1.2.2"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<hashie>, [">= 1.0.0"])
      s.add_dependency(%q<oauth2>, [">= 0.5.0"])
      s.add_dependency(%q<faraday>, [">= 0.7.5"])
      s.add_dependency(%q<json>, [">= 1.0.0"])
      s.add_dependency(%q<rest-client>, [">= 0"])
      s.add_dependency(%q<i18n>, [">= 0"])
      s.add_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_dependency(%q<bundler>, ["> 1.0.0"])
      s.add_dependency(%q<fakeweb>, ["~> 1.3.0"])
      s.add_dependency(%q<rspec>, [">= 2.6.0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 3.9.0"])
      s.add_dependency(%q<redgreen>, ["~> 1.2.2"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<hashie>, [">= 1.0.0"])
    s.add_dependency(%q<oauth2>, [">= 0.5.0"])
    s.add_dependency(%q<faraday>, [">= 0.7.5"])
    s.add_dependency(%q<json>, [">= 1.0.0"])
    s.add_dependency(%q<rest-client>, [">= 0"])
    s.add_dependency(%q<i18n>, [">= 0"])
    s.add_dependency(%q<rake>, ["~> 0.9.2"])
    s.add_dependency(%q<bundler>, ["> 1.0.0"])
    s.add_dependency(%q<fakeweb>, ["~> 1.3.0"])
    s.add_dependency(%q<rspec>, [">= 2.6.0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 3.9.0"])
    s.add_dependency(%q<redgreen>, ["~> 1.2.2"])
  end
end

