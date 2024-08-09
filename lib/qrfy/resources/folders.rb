# frozen_string_literal: true

# :markup: markdown

module Qrfy
  module Resources
    # # Folder Qrfy Resource
    #
    # You can list and create new folders.
    class Folders < Base
      def list
        response = get_request("folders")
        Collection.from_response(response.body, type: Qrfy::Objects::Folder)
      end

      def create(**attributes)
        response = post_request("folders", body: attributes)
        response.body["id"]
      end
    end
  end
end
