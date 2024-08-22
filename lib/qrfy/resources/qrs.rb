# frozen_string_literal: true

# :markup: markdown

module Qrfy
  module Resources
    # # Qrs Qrfy Resource
    #
    # A CRUD interface for the actual Qr API calls.
    class Qrs < Base
      def batch_delete(ids:)
        post_request("qrs/batch-delete", body: { ids: ids.map(&:to_i) })

        true
      end

      def delete(id)
        batch_delete(ids: array_wrap(id))
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

      def retrieve_image(id, format: :png)
        response = get_request("qrs/#{id}/#{format}")

        response.body
      end

      def update(id, params)
        response = put_request("qrs/#{id}", body: params)

        response.body["id"]
      end
    end
  end
end
