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

  def test_folders_listing
    stub = stub_request("folders", response: stub_response(fixture: "folders/list"))
    client = Qrfy::Client.new(api_key: "fake", adapter: :test, stubs: stub)

    folders = client.folders.list

    assert_equal(1, folders.length)

    folder = folders.first

    assert_equal(Qrfy::Objects::Folder, folder.class)
    assert_equal("Folder name", folder.name)
    assert_equal(Time.new("2022-11-01T20:51:14.000Z"), folder.created_at)
    assert_equal(10, folder.qrs)
    assert_equal(1, folder.id)
  end

  def test_folders_create
    stubbed_response = stub_response(fixture: "folders/create", status: 201)
    body = { name: "Folder 1" }
    stub = stub_request("folders", response: stubbed_response, method: :post, body: body)
    client = Qrfy::Client.new(api_key: "fake", adapter: :test, stubs: stub)

    folder_id = client.folders.create(**body)
    assert_equal 0, folder_id
  end

  def test_create
    stubbed_response = stub_response(fixture: "qrs/create", status: 200)
    qr_params = { name: "QR1", type: "text", data: { text: "QR1 data" } }
    stub = stub_request("qrs", response: stubbed_response, method: :post, body: { qrs: [qr_params] })
    client = Qrfy::Client.new(api_key: "fake", adapter: :test, stubs: stub)

    qr_ids = client.qrs.create(qr_params)
    assert_equal [1, 2, 3, 4], qr_ids
  end

  def test_list_qrs
    stubbed_response = stub_response(fixture: "qrs/list", status: 200)
    stub = stub_request("qrs", response: stubbed_response, method: :get)
    client = Qrfy::Client.new(api_key: "fake", adapter: :test, stubs: stub)

    qrs = client.qrs.list
    assert_equal 1, qrs.length

    qr = qrs.first
    assert_equal 0, qr.id
  end

  def test_qrs_get
    qr_id = 0

    stubbed_response = stub_response(fixture: "qrs/get", status: 200)
    stub = stub_request("qrs/#{qr_id}", response: stubbed_response, method: :get)
    client = Qrfy::Client.new(api_key: "fake", adapter: :test, stubs: stub)

    qr = client.qrs.get(qr_id)
    assert_equal qr_id, qr.id
  end

  def test_qrs_batch_delete
    stubbed_response = stub_response(status: 204)
    body = { ids: [0] }
    stub = stub_request("qrs/batch-delete", response: stubbed_response, method: :post, body: body)
    client = Qrfy::Client.new(api_key: "fake", adapter: :test, stubs: stub)

    result = client.qrs.batch_delete(ids: body[:ids])

    assert_equal true, result
  end
end
