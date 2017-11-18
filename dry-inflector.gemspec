
# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dry/inflector/version"

Gem::Specification.new do |spec|
  spec.name          = "dry-inflector"
  spec.version       = Dry::Inflector::VERSION
  spec.authors       = ["Luca Guidi", "Andrii Savchenko", "Abinoam P. Marques Jr."]
  spec.email         = ["me@lucaguidi.com", "andrey@aejis.eu", "abinoam@gmail.com"]

  spec.summary       = "DRY Inflector"
  spec.description   = "String inflections for dry-rb"
  spec.homepage      = "http://dry-rb.org"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.files         = `git ls-files -- lib/* CHANGELOG.md LICENSE.md README.md dry-inflector.gemspec`.split($INPUT_RECORD_SEPARATOR)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake",    "~> 12.0"
  spec.add_development_dependency "rspec",   "~> 3.7"
  spec.add_development_dependency "rubocop", "~> 0.50.0"
end
