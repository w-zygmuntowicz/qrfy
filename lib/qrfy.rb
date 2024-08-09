# frozen_string_literal: true

require "faraday"
require "faraday/parse_dates"

require_relative "qrfy/version"

module Qrfy
  autoload :Client, "qrfy/client"
  autoload :Configuration, "qrfy/configuration"
  autoload :Resources, "qrfy/resources"
  autoload :Errors, "qrfy/errors"
  autoload :Objects, "qrfy/objects"
  autoload :Collection, "qrfy/collection"

  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Qrfy::Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
