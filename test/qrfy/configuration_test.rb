require "test_helper"

class ConfigurationTest < Minitest::Test
  def test_api_key
    config = Qrfy::Configuration.new
    config.api_key = "API-1234"

    assert_equal("API-1234", config.api_key)
  end
end
