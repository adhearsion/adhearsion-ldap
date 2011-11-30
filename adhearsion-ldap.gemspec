# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "adhearsion/ldap/version"

Gem::Specification.new do |s|
  s.name        = "adhearsion-ldap"
  s.version     = Adhearsion::LDAP::VERSION
  s.authors     = ["Taylor Carpenter", "Juan de Bravo", "Ben Langfeld"]
  s.email       = ["tcarpenter@mojolingo.com", "juandebravo@gmail.com", "ben@langfeld.me"]
  s.homepage    = "http://adhearsion.com"
  s.summary     = %q{LDAP configuration for Adhearsion}
  s.description = %q{An Adhearsion Plugin providing LDAP configurability}

  s.rubyforge_project = "adhearsion-ldap"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # s.add_runtime_dependency %q<adhearsion>, [">= 2.0.0"]
  s.add_runtime_dependency %q<activesupport>, [">= 3.0.10"]
  s.add_runtime_dependency "activeldap"

  s.add_development_dependency %q<bundler>, ["~> 1.0"]
  s.add_development_dependency %q<rspec>, [">= 2.5.0"]
end
