module Qrfy
  module Resources
    class Folders < Base
      def list(**params)
        response = get_request("folders", params: params)
        Collection.from_response(response, type: Qrfy::Objects::Folder)
      end
    end
  end
end
