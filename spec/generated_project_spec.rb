# frozen_string_literal: true

require 'fileutils'
require 'open3'
require 'ffaker'

RSpec.describe 'Generated project from template' do
  let(:gem_name) { 'faraday-my_middleware' }
  let(:gem_summary) { 'Summary of Faraday My Middleware' }

  let(:author_name) { FFaker::Name.name }
  let(:author_email) { FFaker::Internet.email }
  let(:namespace) { FFaker::Internet.user_name }

  let(:author_name_string) do
    quote = author_name.include?("'") ? '"' : "'"
    "#{quote}#{author_name}#{quote}"
  end

  before do
    system "git config user.name \"#{author_name}\""
    system "git config user.email \"#{author_email}\""

    ## https://stackoverflow.com/a/25326622/2630849
    ## https://stackoverflow.com/a/54626184/2630849
    Open3.popen3(
      "gem_generator #{gem_name} #{__dir__}/../template --namespace=#{namespace}"
    ) do |stdin, _stdout, stderr, wait_thread|
      Thread.new do
        stderr.each { |l| puts l } unless stderr.closed?
      end

      stdin.puts gem_summary
      stdin.close

      wait_thread.value
    end

    Dir.chdir gem_name
  end

  after do
    Dir.chdir '..'

    FileUtils.rm_r gem_name

    system 'git config --unset user.name'
    system 'git config --unset user.email'
  end

  describe 'files' do
    let(:file_path) { self.class.description }

    describe 'content' do
      subject { File.read file_path }

      describe 'bin/console' do
        let(:expected_lines) do
          [
            "require_relative '../lib/faraday/my_middleware'"
          ]
        end

        it { is_expected.to include_lines expected_lines }
      end

      describe 'faraday-my_middleware.gemspec' do
        let(:expected_lines) do
          [
            "require_relative 'lib/faraday/my_middleware/version'",
            "spec.name = 'faraday-my_middleware'",
            'spec.version = Faraday::MyMiddleware::VERSION',
            "spec.authors = [#{author_name_string}]",
            "spec.email = ['#{author_email}']",
            "spec.summary = '#{gem_summary}'",
            "github_uri = \"https://github.com/#{namespace}/\#{spec.name}\""
          ]
        end

        it { is_expected.to include_lines expected_lines }
      end

      describe 'lib/faraday/my_middleware.rb' do
        let(:expected_lines) do
          [
            "require_relative 'my_middleware/middleware'",
            "require_relative 'my_middleware/version'",
            'module MyMiddleware',

            '# * conn.use Faraday::MyMiddleware::Middleware',
            '# * conn.use :my_middleware',

            'Faraday::Middleware.register_middleware(my_middleware: Faraday::MyMiddleware::Middleware)',

            '# Load middleware with conn.request :my_middleware',
            '# Faraday::Request.register_middleware(my_middleware: Faraday::MyMiddleware::Middleware)',

            '# Load middleware with conn.response :my_middleware',
            '# Faraday::Response.register_middleware(my_middleware: Faraday::MyMiddleware::Middleware)'
          ]
        end

        it { is_expected.to include_lines expected_lines }
      end

      ## The subject is dynamic and different
      # rubocop:disable RSpec/RepeatedExampleGroupBody
      describe 'lib/faraday/my_middleware/middleware.rb' do
        let(:expected_lines) do
          [
            'module MyMiddleware'
          ]
        end

        it { is_expected.to include_lines expected_lines }
      end

      describe 'lib/faraday/my_middleware/version.rb' do
        let(:expected_lines) do
          [
            'module MyMiddleware'
          ]
        end

        it { is_expected.to include_lines expected_lines }
      end
      # rubocop:enable RSpec/RepeatedExampleGroupBody

      describe 'spec/faraday/my_middleware/middleware_spec.rb' do
        let(:expected_lines) do
          [
            'RSpec.describe Faraday::MyMiddleware::Middleware do'
          ]
        end

        it { is_expected.to include_lines expected_lines }
      end

      describe 'spec/faraday/my_middleware/version_spec.rb' do
        let(:expected_lines) do
          [
            "RSpec.describe 'Faraday::MyMiddleware::VERSION' do"
          ]
        end

        it { is_expected.to include_lines expected_lines }
      end
    end

    describe 'permissions' do
      subject { File.stat(file_path).mode }

      describe 'bin/console' do
        let(:expected_permissions) do
          File.stat("#{__dir__}/../template/bin/console.erb").mode
        end

        it { is_expected.to eq expected_permissions }
      end
    end
  end

  describe 'outdated Ruby gems' do
    subject do
      Bundler.with_unbundled_env do
        system 'bundle outdated'
      end
    end

    ## https://github.com/deivid-rodriguez/pry-byebug/pull/346#issuecomment-817706135
    pending { is_expected.to be true }
  end

  describe 'RuboCop check' do
    subject do
      Bundler.with_unbundled_env do
        ## `--config` is a hack for strange RuboCop behavior (no offenses when there are)
        system 'bundle exec rubocop --config .rubocop.yml'
      end
    end

    it { is_expected.to be true }
  end

  describe 'RSpec check' do
    subject do
      Bundler.with_unbundled_env do
        system 'bundle exec rspec'
      end
    end

    it { is_expected.to be true }
  end
end
