module Qrfy
  module Resources
    class Base
      attr_reader :client

      def initialize(client)
        @client = client
      end

      private

      def get_request(url, params: {}, headers: {})
        handle_response client.connection.get(url, params, headers.merge({ "API-KEY" => client.api_key }))
      end

      def post_request(url, body:, headers: {})
        handle_response client.connection.post(url, body, headers.merge({ "API-KEY" => client.api_key }))
      end

      def put_request(url, body:, headers: {})
        handle_response client.connection.put(url, body, headers.merge({ "API-KEY" => client.api_key }))
      end

      def handle_response(response)
        message = response.body["error"] if response.body.is_a?(Hash)

        case response.status
        when 400
          raise Qrfy::Errors::RecordInvalid, "Your request was malformed. #{message}"
        when 401
          raise Qrfy::Errors::Unauthorized,
                "You did not supply valid authentication credentials. #{message}"
        when 404
          raise Qrfy::Errors::RecordNotFound, "Not found (check if folder exists). #{message}"
        when 429
          raise Qrfy::Errors::TooManyRequests, "Your request exceeded the API rate limit. #{message}"
        when 500, 503
          raise Qrfy::Errors::InternalServerError,
                "Could not perform the request due to server-side problems. #{message}"
        end

        response
      end

      def array_wrap(value)
        value.is_a?(Array) ? value : [value]
      end

      def array_unwrap(ary)
        return ary.first if ary.length == 1

        ary
      end
    end
  end
end
