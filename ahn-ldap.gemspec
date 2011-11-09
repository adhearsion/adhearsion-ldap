# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ahn_ldap/version"

Gem::Specification.new do |s|
  s.name        = "ahn-ldap"
  s.version     = AhnLDAP::VERSION
  s.authors     = ["Taylor Carpenter"]
  s.email       = ["tcarpenter@mojolingo.com"]
  s.homepage    = "http://adhearsion.com"
  s.summary     = %q{LDAP configuration for Adhearsion}
  s.description = %q{An Adhearsion Plugin providing LDAP configurability}

  s.rubyforge_project = "ahn-ldap"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # s.add_runtime_dependency %q<adhearsion>, [">= 2.0.0"]
  s.add_runtime_dependency %q<activesupport>, [">= 3.0.10"]

  s.add_development_dependency %q<bundler>, ["~> 1.0.0"]
  s.add_development_dependency %q<rspec>, [">= 2.5.0"]
  s.add_development_dependency %q<ci_reporter>, [">= 1.6.3"]
  s.add_development_dependency %q<simplecov>, [">= 0"]
  s.add_development_dependency %q<simplecov-rcov>, [">= 0"]
  s.add_development_dependency %q<yard>, ["~> 0.6.0"]
  s.add_development_dependency %q<rake>, [">= 0"]
  s.add_development_dependency %q<mocha>, [">= 0"]
  s.add_development_dependency %q<guard-rspec>
  #s.add_development_dependency %q<bones>
end
