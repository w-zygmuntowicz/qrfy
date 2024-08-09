# frozen_string_literal: true

module Qrfy
  module Errors
    autoload :Base, "qrfy/errors/base"
    autoload :InternalServerError, "qrfy/errors/internal_server_error"
    autoload :RecordInvalid, "qrfy/errors/record_invalid"
    autoload :RecordNotFound, "qrfy/errors/record_not_found"
    autoload :TooManyRequests, "qrfy/errors/too_many_requests"
    autoload :Unauthorized, "qrfy/errors/unathorized"
  end
end
