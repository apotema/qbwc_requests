# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qbwc_requests/version'

Gem::Specification.new do |spec|
  spec.name          = "qbwc_requests"
  spec.version       = QbwcRequests::VERSION
  spec.authors       = ["Alexandre Mondaini Calvão"]
  spec.email         = ["apotema@gmail.com"]
  spec.description   = %q{A qbxml request generator}
  spec.summary       = %q{This gem helps you generate Qbxml requests}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "qbxml", "~> 0.4.0"
  spec.add_runtime_dependency "activemodel", ">= 4"
  spec.add_development_dependency "colorize", "~> 0.7.7"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.4.1"
end
