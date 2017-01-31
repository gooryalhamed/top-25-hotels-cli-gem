# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'top25/version'

Gem::Specification.new do |spec|
  spec.authors       = ["Yardagan Al Hamed"]
  spec.email         = ["yarda.hamed@gmail.com"]
  spec.description   = %q{This gem allows users to search for best 25 hotels, restaurants and beaches in the world.}
  spec.summary       = %q{Top 25 cli data gem}
  spec.homepage      = "https://learn.co/gooryalhamed"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = ["top25"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.name          = "top25"
  spec.require_paths = ["lib", "lib/top25"]
  spec.version       = Top25::VERSION
  spec.license       = "MIT"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "colorize"
end
