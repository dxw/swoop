# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swoop/version'

Gem::Specification.new do |spec|
  spec.name          = "swoop"
  spec.version       = Swoop::VERSION
  spec.authors       = ["Philip Vieira"]
  spec.email         = ["philip@dxw.com"]
  spec.summary       = %q{Ruby gem for dxw flavored rails logging.}
  spec.homepage      = "https://github.com/dxw/swoop"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
