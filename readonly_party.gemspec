# -*- encoding: utf-8 -*-
$LOAD_PATH.push(File.expand_path "../lib", __FILE__)
require "readonly_party/version"

Gem::Specification.new do |gem|
  gem.authors       = ["Joel Meador"]
  gem.email         = ["joel@expectedbehavior.com"]
  gem.description   = %q{This is meant to be used in the same way as HTTParty and uses it under the covers. Except, when the ReadonlyParty module is included in a class, it explicitly disallows post, put, delete, and patch methods from being called on that class.}
  gem.summary       = %q{An HTTParty where the resources never change, the points are made up, and everyboday wins.}
  gem.homepage      = "http://www.expectedbehavior.com"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "readonly_party"
  gem.require_paths = ["lib"]
  gem.version       = ReadonlyParty::VERSION

  gem.add_dependency "httparty"

  gem.add_development_dependency "minitest"
  gem.add_development_dependency "webmock"
end
