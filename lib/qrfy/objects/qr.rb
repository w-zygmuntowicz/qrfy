# frozen_string_literal: true

# :markup: markdown

module Qrfy
  module Objects
    # # Qr Qrfy Object
    #
    # The abstraction on the actual Qr image. Each Qr has it's id by which it should be referenced.
    # For each Qr you can generate actual image in different image formats (png, webp, etc.).
    class Qr < Base
      def created_at
        Time.at(createdAt)
      end
    end
  end
end
