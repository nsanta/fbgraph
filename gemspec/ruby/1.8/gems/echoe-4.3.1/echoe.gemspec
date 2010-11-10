# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{echoe}
  s.version = "4.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Evan Weaver"]
  s.cert_chain = ["/Users/eweaver/p/configuration/gem_certificates/evan_weaver-original-public_cert.pem"]
  s.date = %q{2010-05-01}
  s.description = %q{A Rubygems packaging tool that provides Rake tasks for documentation, extension compiling, testing, and deployment.}
  s.email = %q{}
  s.extra_rdoc_files = ["CHANGELOG", "LICENSE", "README", "TODO", "lib/echoe.rb", "lib/echoe/extensions.rb", "lib/echoe/platform.rb", "lib/echoe/rubygems.rb"]
  s.files = ["CHANGELOG", "LICENSE", "MIT-LICENSE", "Manifest", "README", "Rakefile", "TODO", "echoe.gemspec", "lib/echoe.rb", "lib/echoe/extensions.rb", "lib/echoe/platform.rb", "lib/echoe/rubygems.rb", "vendor/rake/MIT-LICENSE", "vendor/rake/lib/rake/contrib/compositepublisher.rb", "vendor/rake/lib/rake/contrib/ftptools.rb", "vendor/rake/lib/rake/contrib/publisher.rb", "vendor/rake/lib/rake/contrib/rubyforgepublisher.rb", "vendor/rake/lib/rake/contrib/sshpublisher.rb", "vendor/rake/lib/rake/contrib/sys.rb"]
  s.homepage = %q{http://blog.evanweaver.com/files/doc/fauna/echoe/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Echoe", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{fauna}
  s.rubygems_version = %q{1.3.6}
  s.signing_key = %q{/Users/eweaver/p/configuration/gem_certificates/evan_weaver-original-private_key.pem}
  s.summary = %q{A Rubygems packaging tool that provides Rake tasks for documentation, extension compiling, testing, and deployment.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<gemcutter>, [">= 0"])
      s.add_runtime_dependency(%q<rubyforge>, [">= 0"])
    else
      s.add_dependency(%q<gemcutter>, [">= 0"])
      s.add_dependency(%q<rubyforge>, [">= 0"])
    end
  else
    s.add_dependency(%q<gemcutter>, [">= 0"])
    s.add_dependency(%q<rubyforge>, [">= 0"])
  end
end
