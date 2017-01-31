# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'top/version'

Gem::Specification.new do |spec|
  spec.name          = "top25"
  spec.version       = top25::VERSION
  spec.authors       = ["Yardagan AL Hamed"]
  spec.email         = ["yarda.hamed@gmail.com"]

  spec.summary       = %q{TODO: search for best 25 hotels,restaurants and beaches.}
  spec.description   = %q{TODO: This gem is a cli data gem, it allows the user to search for the best 25 hotels,restaurants and beaches in the world.}
  spec.homepage      = "TODO: https://learn.co/gooryalhamed"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
