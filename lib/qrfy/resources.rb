# frozen_string_literal: true

# :markup: markdown

module Qrfy
  # # Qrfy Resources
  #
  # Resources are a way to abstract REST resources. Each time you want to interact with API
  # you should use a subclass of a Base Resource.
  module Resources
    autoload :Base, "qrfy/resources/base"
    autoload :Folders, "qrfy/resources/folders"
    autoload :Qrs, "qrfy/resources/qrs"
  end
end
