# frozen_string_literal: true

require_relative "qrfy/version"

module Qrfy
  autoload :Client, "qrfy/client"
  autoload :Configuration, "qrfy/configuration"

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Qrfy::Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
