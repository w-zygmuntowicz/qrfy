# frozen_string_literal: true

module Qrfy
  module Objects
    class Qr < Base
      def created_at
        Time.at(createdAt)
      end
    end
  end
end
