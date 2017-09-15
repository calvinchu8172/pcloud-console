Before '@webmock' do
  # Device Cert - Index
  stub_request(:get, "https://#{ENV['PCLOUD_API_HOST']}/v1/device_certs").with(
    query: hash_including({ certificate_serial: ENV['CERTIFICATE_SERIAL'] })
  ).to_return{ |request|
    @device_certs ||= []
    # 產生 response
    response = {
      data: @device_certs.map(&:serializable_hash)
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # Device Cert - Create
  stub_request(:post, "https://#{ENV['PCLOUD_API_HOST']}/v1/device_certs").to_return{ |request|
    params = Rack::Utils.parse_nested_query(request.body)
    attributes = {
      serial: "53152101-d6fe-4cb7-afb7-64e0f905a4b6",
      description: "Device Cert Description 1",
      created_at: '2017-07-18T06:52:47.031Z',
      updated_at: '2017-07-18T06:52:47.032Z'
    }
    device_cert = Pcloud::DeviceCert.new(attributes)
    @device_certs ||= []
    @device_certs << device_cert
    # 產生 response
    response = {
      data: device_cert.serializable_hash
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # Device Cert - Show for id: 53152101-d6fe-4cb7-afb7-64e0f905a4b6
  stub_request(:get, "https://#{ENV['PCLOUD_API_HOST']}/v1/device_certs/53152101-d6fe-4cb7-afb7-64e0f905a4b6").with(
    query: hash_including({ certificate_serial: ENV['CERTIFICATE_SERIAL'] })
  ).to_return{ |request|
    @device_certs ||= []
    device_cert = @device_certs.find{ |x| x.id == "53152101-d6fe-4cb7-afb7-64e0f905a4b6" }
    # 產生 response
    response = {
      data: device_cert.serializable_hash
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # Device Cert - Update
  stub_request(:put, "https://#{ENV['PCLOUD_API_HOST']}/v1/device_certs/53152101-d6fe-4cb7-afb7-64e0f905a4b6").to_return{ |request|
    params = Rack::Utils.parse_nested_query(request.body)
    attributes = {
      serial: "53152101-d6fe-4cb7-afb7-64e0f905a4b6",
      description: "DEVICE_CERT_DESCRIPTION1_MODIFY",
      created_at: '2017-07-14T02:56:42.276Z',
      updated_at: '2017-07-18T06:52:47.032Z'
    }
    device_cert = @device_certs.find{ |x| x.id == "53152101-d6fe-4cb7-afb7-64e0f905a4b6" }
    device_cert.attributes = attributes
    # 產生 response
    response = {
      data: device_cert.serializable_hash
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

end
