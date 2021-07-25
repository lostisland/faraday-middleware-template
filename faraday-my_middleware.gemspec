# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'faraday/my_middleware/version'

Gem::Specification.new do |spec|
  spec.name = 'faraday-my_middleware'
  spec.version = Faraday::MyMiddleware::VERSION
  spec.authors = ['Your Name']
  spec.email = ['your_name@gmail.com']

  spec.summary = 'Faraday middleware for MyMiddleware'
  spec.description = 'Faraday middleware for MyMiddleware'
  spec.homepage = 'https://github.com/lostisland/faraday-my_middleware'
  spec.license = 'MIT'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/lostisland/faraday-my_middleware'
  spec.metadata['changelog_uri'] = 'https://github.com/lostisland/faraday-my_middleware'

  spec.files = Dir.glob('lib/**/*') + %w[README.md LICENSE.md]
  spec.require_paths = ['lib']

  spec.add_development_dependency 'faraday', '~> 1.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.19.0'

  spec.add_development_dependency 'rubocop', '~> 1.12.0'
  spec.add_development_dependency 'rubocop-packaging', '~> 0.5'
  spec.add_development_dependency 'rubocop-performance', '~> 1.0'
end
