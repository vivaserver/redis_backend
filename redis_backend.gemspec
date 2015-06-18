# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redis_backend/version'

Gem::Specification.new do |spec|
  spec.name          = "redis_backend"
  spec.version       = RedisBackend::VERSION
  spec.authors       = ["Cristian R. Arroyo"]
  spec.email         = ["cristian.arroyo@vivaserver.com"]
  spec.description   = %q{Protect operations from Redis backend unavailability gracefully}
  spec.summary       = %q{Protect operations from Redis backend unavailability gracefully}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'redis'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
