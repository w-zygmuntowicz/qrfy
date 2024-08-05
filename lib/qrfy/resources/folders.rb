module Qrfy
  module Resources
    class Folders < Base
      def list
        response = get_request("folders")
        Collection.from_response(response, type: Qrfy::Objects::Folder)
      end

      def create(**attributes)
        response = post_request("folders", body: attributes)
        response.body["id"]
      end
    end
  end
end
