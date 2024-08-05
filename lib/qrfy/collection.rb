module Qrfy
  class Collection
    def initialize(data:, total:, next_cursor:, prev_cursor:)
      @data = data
      @total = total
      @next_cursor = next_cursor
      @prev_cursor = prev_cursor
    end

    class << self
      def from_response(response, type:)
        response.body.map { |attrs| type.new(attrs) }
      end
    end
  end
end
