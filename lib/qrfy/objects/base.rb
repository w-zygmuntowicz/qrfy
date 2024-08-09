# frozen_string_literal: true

# :markup: markdown

require "ostruct"

module Qrfy
  module Objects
    # # Base Qrfy Object
    #
    # Base class to be subclassed from for each object generated from HTTP response.
    class Base < OpenStruct
      def initialize(attributes)
        super to_ostruct(attributes)
      end

      def to_ostruct(obj)
        if obj.is_a?(Hash)
          OpenStruct.new(obj.transform_values { |val| to_ostruct(val) })
        elsif obj.is_a?(Array)
          obj.map { |o| to_ostruct(o) }
        else
          obj
        end
      end
    end
  end
end
