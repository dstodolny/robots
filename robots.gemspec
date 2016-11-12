# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'robots/version'

Gem::Specification.new do |spec|
  spec.name          = "robots"
  spec.version       = Robots::VERSION
  spec.authors       = ["Dominik Stodolny"]
  spec.email         = ["dom@dmk.st"]

  spec.summary       = %q{Calculates final positions of robots on the grid}
  spec.description   = %q{Calculates final positions of robots on the grid}
  spec.homepage      = "https://github.com/dstodolny/robots"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables   = ["robots"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
