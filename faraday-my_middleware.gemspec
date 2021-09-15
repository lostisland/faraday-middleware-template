# frozen_string_literal: true

require_relative 'lib/faraday/my_middleware/version'

Gem::Specification.new do |spec|
  spec.name = 'faraday-my_middleware'
  spec.version = Faraday::MyMiddleware::VERSION
  spec.authors = ['Your Name']
  spec.email = ['your_name@gmail.com']

  spec.summary = 'Faraday middleware for MyMiddleware'
  spec.description = <<~DESC
    Faraday middleware for MyMiddleware
  DESC
  spec.license = 'MIT'

  github_uri = "https://github.com/your_nickname/#{spec.name}"

  spec.homepage = github_uri

  spec.metadata = {
    'bug_tracker_uri' => "#{github_uri}/issues",
    'changelog_uri' => "#{github_uri}/blob/v#{spec.version}/CHANGELOG.md",
    'documentation_uri' => "http://www.rubydoc.info/gems/#{spec.name}/#{spec.version}",
    'homepage_uri' => spec.homepage,
    'source_code_uri' => github_uri,
    'wiki_uri' => "#{github_uri}/wiki"
  }

  spec.files = Dir['lib/**/*', 'README.md', 'LICENSE.md', 'CHANGELOG.md']

  spec.required_ruby_version = '>= 2.5', '< 4'

  spec.add_development_dependency 'faraday', '~> 1.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.21.0'

  spec.add_development_dependency 'rubocop', '~> 1.21.0'
  spec.add_development_dependency 'rubocop-packaging', '~> 0.5'
  spec.add_development_dependency 'rubocop-performance', '~> 1.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.0'
end
