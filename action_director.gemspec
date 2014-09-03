# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'action_director/version'

Gem::Specification.new do |spec|
  spec.name          = "action_director"
  spec.version       = ActionDirector::VERSION
  spec.authors       = ["Ritchie Paul Buitre"]
  spec.email         = ["ritchie@richorelse.com"]
  spec.description   = %q{Directs objects' behaviors}
  spec.summary       = %q{You can think of it as either a router for your objects, or as a rapid prototyping toolset.}
  spec.homepage      = "https://github.com/RichOrElse/action-director"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "minitest", "~> 4.7"
  spec.add_development_dependency "minitest-reporters", "~> 1.0"
  spec.add_development_dependency "pry", "~> 0.9"
end
