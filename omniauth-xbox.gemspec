$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'omniauth/xbox/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-xbox'
  spec.version       = Omniauth::Xbox::VERSION
  spec.authors       = ['Pedro Candeias']
  spec.email         = ['pedromiguelcandeias@gmail.com']

  spec.summary       = 'Xbox OAuth2 Strategy for OmniAuth'
  spec.description   = spec.summary
  spec.homepage      = 'http://github.com/PedrOC20/omniauth-xbox'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth', '~> 2.1.0'
  spec.add_runtime_dependency 'omniauth-oauth2'

  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
end