# frozen_string_literal: true

RSpec.describe Faraday::MyMiddleware do
  it 'has a version number' do
    expect(Faraday::MyMiddleware::VERSION).to be_a(String)
  end
end
