# frozen_string_literal: true

# :markup: markdown

module Qrfy
  module Errors
    # # Too Many Requests Qrfy Error
    #
    # Wrapper around the too many requests HTTP call response (code 429).
    class TooManyRequests < Base; end
  end
end
