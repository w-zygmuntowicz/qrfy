# frozen_string_literal: true

# :markup: markdown

module Qrfy
  module Errors
    # # Unauthorized Qrfy Error
    #
    # Wrapper around the unauthorized HTTP call response (code 401).
    class Unauthorized < Base; end
  end
end
