# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fbgraph}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nicolas Santa"]
  s.cert_chain = ["/home/nicolas/certs/gem-public_cert.pem"]
  s.date = %q{2010-05-12}
  s.description = %q{A Gem for Facebook Open Graph API}
  s.email = %q{nicolas55ar@gmail.com}
  s.extra_rdoc_files = ["README", "README.textile", "TODO.list", "lib/fbgraph.rb", "lib/fbgraph/authorization.rb", "lib/fbgraph/base.rb", "lib/fbgraph/client.rb", "lib/fbgraph/realtime.rb", "lib/fbgraph/search.rb", "lib/fbgraph/selection.rb"]
  s.files = ["Manifest", "README", "README.textile", "Rakefile", "TODO.list", "lib/fbgraph.rb", "lib/fbgraph/authorization.rb", "lib/fbgraph/base.rb", "lib/fbgraph/client.rb", "lib/fbgraph/realtime.rb", "lib/fbgraph/search.rb", "lib/fbgraph/selection.rb", "pkg/fbgraph-0.0.5.gem", "pkg/fbgraph-0.0.5.tar.gz", "pkg/fbgraph-0.0.5/Manifest", "pkg/fbgraph-0.0.5/README", "pkg/fbgraph-0.0.5/README.textile", "pkg/fbgraph-0.0.5/Rakefile", "pkg/fbgraph-0.0.5/TODO.list", "pkg/fbgraph-0.0.5/fbgraph.gemspec", "pkg/fbgraph-0.0.5/lib/fbgraph.rb", "pkg/fbgraph-0.0.5/lib/fbgraph/authorization.rb", "pkg/fbgraph-0.0.5/lib/fbgraph/base.rb", "pkg/fbgraph-0.0.5/lib/fbgraph/client.rb", "pkg/fbgraph-0.0.5/lib/fbgraph/realtime.rb", "pkg/fbgraph-0.0.5/lib/fbgraph/search.rb", "pkg/fbgraph-0.0.5/lib/fbgraph/selection.rb", "pkg/fbgraph-0.0.5/specs/lib/fbauth/authorization_spec.rb", "pkg/fbgraph-0.0.5/specs/lib/fbauth/base_spec.rb", "pkg/fbgraph-0.0.5/specs/lib/fbauth/client_spec.rb", "pkg/fbgraph-0.0.5/specs/lib/fbauth/realtime_spec.rb", "pkg/fbgraph-0.0.5/specs/lib/fbauth/search_spec.rb", "pkg/fbgraph-0.0.5/specs/lib/fbauth/selection_spec.rb", "pkg/fbgraph-0.0.5/specs/spec_helper.rb", "specs/lib/fbauth/authorization_spec.rb", "specs/lib/fbauth/base_spec.rb", "specs/lib/fbauth/client_spec.rb", "specs/lib/fbauth/realtime_spec.rb", "specs/lib/fbauth/search_spec.rb", "specs/lib/fbauth/selection_spec.rb", "specs/spec_helper.rb", "fbgraph.gemspec"]
  s.homepage = %q{http://github.com/nsanta/fbgraph}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Fbgraph", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{fbgraph}
  s.rubygems_version = %q{1.3.6}
  s.signing_key = %q{/home/nicolas/certs/gem-private_key.pem}
  s.summary = %q{A Gem for Facebook Open Graph API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<oauth2>, [">= 0"])
      s.add_development_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<oauth2>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<oauth2>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
  end
end
