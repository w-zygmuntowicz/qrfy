# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "qrfy"

require "minitest/autorun"
require "faraday"
require "json"

module Minitest
  class Test
    def stub_response(fixture: nil, status: 200, headers: { "Content-Type" => "application/json" })
      [status, headers, fixture ? File.read("test/fixtures/#{fixture}.json") : nil]
    end

    def stub_request(path, response:, method: :get, body: {})
      Faraday::Adapter::Test::Stubs.new do |stub|
        arguments = [method, "/api/public/#{path}"]
        arguments << body.to_json if %i[post put patch].include?(method)

        stub.send(*arguments) { |_env| response }
      end
    end
  end
end
