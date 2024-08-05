require "test_helper"

class ClientTest < Minitest::Test
  def test_api_key_from_initializer
    client = Qrfy::Client.new(api_key: "API-1234")

    assert_equal("API-1234", client.api_key)
  end

  def test_api_key_from_configuration
    Qrfy.configure do |config|
      config.api_key = "API-1234"
    end

    client = Qrfy::Client.new

    assert_equal("API-1234", client.api_key)
  end
end
