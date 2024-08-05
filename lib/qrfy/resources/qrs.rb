module Qrfy
  module Resources
    class Qrs < Base
      def batch_delete(ids:)
        post_request("qrs/batch-delete", body: { ids: ids })

        true
      end
    end
  end
end
