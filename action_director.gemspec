# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'action_director/version'
require "action_director/directable"
require "action_director/directive"
require "action_director/directing"

Gem::Specification.new do |spec|
  spec.name          = "action_director"
  spec.version       = ActionDirector::VERSION
  spec.authors       = ["Ritchie Paul Buitre"]
  spec.email         = ["ritchie@richorelse.com"]
  spec.description   = %q{Directs objects' behaviors}
  spec.summary       = %q{You can think of it as either a router for your objects, or as a rapid prototyping toolset.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 4.7.5"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "pry"
end
