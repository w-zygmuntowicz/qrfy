# frozen_string_literal: true

# :markup: markdown

module Qrfy
  # # Qrfy Errors
  #
  # Each error raised by 3rd party gems should be catched and reraised with a custom namespaced errors.
  module Errors
    autoload :Base, "qrfy/errors/base"
    autoload :InternalServerError, "qrfy/errors/internal_server_error"
    autoload :RecordInvalid, "qrfy/errors/record_invalid"
    autoload :RecordNotFound, "qrfy/errors/record_not_found"
    autoload :TooManyRequests, "qrfy/errors/too_many_requests"
    autoload :Unauthorized, "qrfy/errors/unathorized"
  end
end
