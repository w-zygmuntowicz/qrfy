# frozen_string_literal: true

# :markup: markdown

module Qrfy
  # # Qrfy Objects
  #
  # Hide implementation of the actual objects generated from response.
  module Objects
    autoload :Base, "qrfy/objects/base"
    autoload :Folder, "qrfy/objects/folder"
    autoload :Qr, "qrfy/objects/qr"
  end
end
