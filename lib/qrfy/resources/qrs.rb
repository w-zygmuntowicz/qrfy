module Qrfy
  module Resources
    class Qrs < Base
      def batch_delete(ids:)
        post_request("qrs/batch-delete", body: { ids: ids })

        true
      end

      def create(qrs, style: nil, folder_id: nil)
        qrs = array_wrap(qrs)

        body = { qrs: qrs }
        body.merge(style: style) unless style.nil?
        body.merge(folder: folder_id) unless folder_id.nil?

        response = post_request("qrs", body: body)
        array_unwrap(response.body["ids"])
      end

      def list
        response = get_request("qrs")
        Collection.from_response(response.body["data"], type: Qrfy::Objects::Qr)
      end

      def get(id)
        response = get_request("qrs/#{id}")

        Qrfy::Objects::Qr.new(response.body)
      end
    end
  end
end
