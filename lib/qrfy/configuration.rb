# frozen_string_literal: true

module Qrfy
  class Configuration
    attr_accessor :api_key, :adapter

    def initialize
      @api_key = nil
      @adapter = nil
    end
  end
end
