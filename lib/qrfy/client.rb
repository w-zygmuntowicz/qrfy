module Qrfy
  class Client
    BASE_URL = "https://qrfy.com/api/public".freeze

    attr_reader :api_key, :adapter

    def initialize(config = {})
      @api_key = config.key?(:api_key) ? config[:api_key] : Qrfy.configuration.api_key
      @adapter = config.key?(:adapter) ? config[:adapter] : Qrfy.configuration.adapter

      @stubs = config[:stubs]
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :authorization, :Bearer, api_key
        conn.request :json

        conn.response :dates
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
