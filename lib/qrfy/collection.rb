# frozen_string_literal: true

# :markup: markdown

module Qrfy
  # # Qrfy Collection
  #
  # A way to abstract collection API responses.
  class Collection
    def initialize(data:, total:, next_cursor:, prev_cursor:)
      @data = data
      @total = total
      @next_cursor = next_cursor
      @prev_cursor = prev_cursor
    end

    class << self
      def from_response(data, type:)
        data.map { |attrs| type.new(attrs) }
      end
    end
  end
end
