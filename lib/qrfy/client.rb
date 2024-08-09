# frozen_string_literal: true

# :markup: markdown

module Qrfy
  # # Qrfy Client
  #
  # Hides actual implementation of HTTP API calls. You can overwrite the global configuration
  # (api key or http adapter) passing values in the initializer.
  class Client
    BASE_URL = "https://qrfy.com/api/public"

    attr_reader :api_key, :adapter

    def initialize(config = {})
      @api_key = config.key?(:api_key) ? config[:api_key] : Qrfy.configuration.api_key
      @adapter = config.key?(:adapter) ? config[:adapter] : Qrfy.configuration.adapter

      @stubs = config[:stubs]
    end

    def connection
      @connection ||= Faraday.new(url: BASE_URL) do |conn|
        conn.request :json

        conn.response :parse_dates
        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end

    def folders
      Resources::Folders.new(self)
    end

    def qrs
      Resources::Qrs.new(self)
    end
  end
end
