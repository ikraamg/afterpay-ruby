lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'afterpay/version'

Gem::Specification.new do |spec|
  spec.name          = 'afterpay'
  spec.version       = Afterpay::VERSION
  spec.authors       = ['Sergey Vygovsky', 'Yuriy Kushnir', 'Christian Rimondi', 'Jordy Garcia']
  spec.email         = 'contact@solidus.io'
  spec.homepage      = 'http://solidus.io'

  spec.summary       = 'Provides Ruby SDK for AfterPay payment service provider.'
  spec.description   = spec.summary
  spec.license       = 'Apache-2.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_runtime_dependency     'faraday',            '~> 0.15', '>= 0.15.3'
  spec.add_runtime_dependency     'faraday_middleware', '~> 0.12', '>= 0.12.2'
  spec.add_runtime_dependency     'hashie',             '~> 3.6',  '>= 3.6.0'

  spec.add_development_dependency 'faker',              '~> 1.9.1'
  spec.add_development_dependency 'factory_bot',        '~> 4.11.1'
  spec.add_development_dependency 'coveralls',          '~> 0.8.22'
  spec.add_development_dependency 'bundler',            '~> 2.2.22'
  spec.add_development_dependency 'rake',               '~> 10.0'
  spec.add_development_dependency 'rspec',              '~> 3.0'
  spec.add_development_dependency 'webmock',            '~> 2.1'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.4.1'
  spec.add_development_dependency 'rubocop',            '~> 1.18', '>= 1.18.4'
  spec.add_development_dependency 'relaxed-rubocop',    '~> 2.5'
end
