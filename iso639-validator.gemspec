# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iso639/validator/version'

Gem::Specification.new do |spec|
  spec.name          = "iso639-validator"
  spec.version       = Iso639::Validator::VERSION
  spec.authors       = ["merlos"]
  spec.email         = ["jmmerlos@merlos.org"]
  spec.summary       = %q{Validates if a value is an existing ISO-631
entry}
  spec.description   = %q{Validates that a value is either an alfa-2
code, alfa-3 code, French name or English name}
  spec.homepage      = "https://github.com/merlos/iso639-validator.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
