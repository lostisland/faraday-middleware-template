# frozen_string_literal: true

require 'faraday/middleware/my_middleware'
require 'faraday/my_middleware/version'

module Faraday
  # This will be your middleware main module, though the actual middleware implementation will go
  # into Faraday::Middleware::MyMiddleware for the correct namespacing.
  module MyMiddleware
    # Faraday allows you to register your middleware for easier configuration.
    # This step is totally optional, but it basically allows users to use a
    # custom symbol (in this case, `:my_middleware`), to use your middleware in their connections.
    # After calling this line, the following are both valid ways to set the middleware in a connection:
    # * conn.use Faraday::Middleware::MyMiddleware
    # * conn.use :my_middleware
    # Without this line, only the former method is valid.
    Faraday::Middleware.register_middleware(my_middleware: Faraday::Middleware::MyMiddleware)

    # Alternatively, you can register your middleware under Faraday::Request or Faraday::Response.
    # This will allow to load your middleware using the `request` or `response` methods respectively.
    #
    # Load middleware with conn.request :my_middleware
    # Faraday::Request.register_middleware(my_adapter: Faraday::Middleware::MyMiddleware)
    #
    # Load middleware with conn.response :my_middleware
    # Faraday::Response.register_middleware(my_adapter: Faraday::Middleware::MyMiddleware)
  end
end
