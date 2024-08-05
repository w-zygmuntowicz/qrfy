module Qrfy
  class Client
    attr_reader :api_key

    def initialize(config = {})
      @api_key = config.key?(:api_key) ? config[:api_key] : Qrfy.configuration.api_key
    end
  end
end
