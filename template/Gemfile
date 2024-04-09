# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

# This block allows you to dynamically install a different version of Faraday.
# This is useful to test your middleware against multiple versions in the CI Matrix.
# We suggest maintainers to support at least Faraday 1.x and 2.x, but that's up to you!
# Set in `.github/workflows/ci.yaml`, can be safely removed if you don't need this feature.
install_if -> { ENV.fetch('FARADAY_VERSION', nil) } do
  gem 'faraday', ENV.fetch('FARADAY_VERSION', nil)
end

gem 'bundler', '~> 2.0'
gem 'rake', '~> 13.0'
gem 'rspec', '~> 3.0'
gem 'simplecov', '~> 0.22.0'

gem 'rubocop', '~> 1.63.0'
gem 'rubocop-packaging', '~> 0.5.2'
gem 'rubocop-performance', '~> 1.21.0'
gem 'rubocop-rspec', '~> 2.29.1'
