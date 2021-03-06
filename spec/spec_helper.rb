# frozen_string_literal: true

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = :random
end

RSpec::Matchers.define :include_lines do |expected_lines|
  match do |actual_text|
    expected_lines.all? do |expected_line|
      actual_text.lines.any? do |actual_line|
        actual_line.strip == expected_line.strip
      end
    end
  end

  diffable
end
