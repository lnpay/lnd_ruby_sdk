lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lightning/version'

Gem::Specification.new do |spec|
  spec.name          = 'lnd_ruby_sdk'
  spec.version       = Lightning::VERSION
  spec.authors       = ['Rasmus']
  spec.email         = ['rk@youngmedia.se']

  spec.summary       = 'A SDK for communicating with LND\'s gRPC in Ruby'
  spec.homepage      = 'https://github.com/lnpay'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  #spec.bindir        = 'exe'
  #spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib', 'vendor']

  spec.add_dependency 'grpc'

  # use "yard" to build full HTML docs.
  spec.metadata["yard.run"] = "yri"

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.67.2'
  spec.add_development_dependency 'rubocop-performance', '~> 1.1.0'
  spec.add_development_dependency 'yard', '~> 0.9.2'
end
