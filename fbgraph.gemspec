# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fbgraph}
  s.version = "0.1.6.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nicolas Santa"]
  s.date = %q{2010-09-29}
  s.description = %q{A Gem for Facebook Open Graph API}
  s.email = %q{nicolas55ar@gmail.com}
  s.extra_rdoc_files = ["README", "README.textile", "TODO.list", "lib/fbgraph.rb", "lib/fbgraph/authorization.rb", "lib/fbgraph/base.rb", "lib/fbgraph/canvas.rb", "lib/fbgraph/client.rb", "lib/fbgraph/realtime.rb", "lib/fbgraph/search.rb", "lib/fbgraph/selection.rb"]
  s.files = ["Manifest", "README", "README.textile", "Rakefile", "TODO.list", "fbgraph.gemspec", "lib/fbgraph.rb", "lib/fbgraph/authorization.rb", "lib/fbgraph/base.rb", "lib/fbgraph/canvas.rb", "lib/fbgraph/client.rb", "lib/fbgraph/realtime.rb", "lib/fbgraph/search.rb", "lib/fbgraph/selection.rb", "specs/lib/fbauth/authorization_spec.rb", "specs/lib/fbauth/base_spec.rb", "specs/lib/fbauth/client_spec.rb", "specs/lib/fbauth/realtime_spec.rb", "specs/lib/fbauth/search_spec.rb", "specs/lib/fbauth/selection_spec.rb", "specs/spec_helper.rb"]
  s.homepage = %q{http://github.com/nsanta/fbgraph}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Fbgraph", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{fbgraph}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A Gem for Facebook Open Graph API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth2>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<hashie>, [">= 0"])
      s.add_runtime_dependency(%q<rest-client>, [">= 0"])
      s.add_development_dependency(%q<echoe>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<oauth2>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<hashie>, [">= 0"])
      s.add_dependency(%q<rest-client>, [">= 0"])
      s.add_dependency(%q<echoe>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<oauth2>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<hashie>, [">= 0"])
    s.add_dependency(%q<rest-client>, [">= 0"])
    s.add_dependency(%q<echoe>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
