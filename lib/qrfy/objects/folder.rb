# frozen_string_literal: true

# :markup: markdown

module Qrfy
  module Objects
    # # Folder Qrfy Object
    #
    # A way to organize or namespace your Qrs.
    class Folder < Base
      def created_at
        createdAt
      end
    end
  end
end
