# frozen_string_literal: true

# :markup: markdown

module Qrfy
  module Errors
    # # Internal Server Qrfy Error
    #
    # Wrapper around the internal server error HTTP call response (codes 5XX).
    class InternalServerError < Base; end
  end
end
