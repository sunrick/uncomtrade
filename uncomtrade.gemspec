# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uncomtrade/version'

Gem::Specification.new do |spec|
  spec.name          = "uncomtrade"
  spec.version       = Uncomtrade::VERSION
  spec.authors       = ["Rickard Sunden"]
  spec.email         = ["rickard.sunden@outlook.com"]

  spec.summary       = %q{Simple ruby API wrapper for the UN COMTRADE Database.}
  spec.description   = %q{Simple ruby API wrapper for the UN COMTRADE Database.}
  spec.homepage      = "https://github.com/sunrick/uncomtrade"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty", "~> 0.13.7"
  spec.add_runtime_dependency "countries", "~> 1.1.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 3.3'
  spec.add_development_dependency "pry", '~> 0.10.1'
end
