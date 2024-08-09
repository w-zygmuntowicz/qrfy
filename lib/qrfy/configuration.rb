# frozen_string_literal: true

# :markup: markdown

module Qrfy
  # # Configuration
  #
  # A way to store connection configuration such as api_key or http adapter.
  class Configuration
    attr_accessor :api_key, :adapter

    def initialize
      @api_key = nil
      @adapter = nil
    end
  end
end
