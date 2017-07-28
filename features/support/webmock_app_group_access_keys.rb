Before '@webmock' do
  # App Group - Index
  stub_request(:get, "https://#{ENV['PUSH_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/access_keys").with(
    query: hash_including({ access_key_id: ENV['PUSH_ACCESS_KEY_ID'] })
  ).to_return{ |request|
    @access_keys ||= []
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: @access_keys.map(&:serializable_hash)
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # App Group - Create
  stub_request(:post, "https://#{ENV['PUSH_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/access_keys").to_return{ |request|
    params = Rack::Utils.parse_nested_query(request.body)
    attributes = {
      name: params['name'],
      description: params['description'],
      app_group_id: '569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      app_group_topic_arn: 'arn:aws:sns:us-east-1:567710019248:569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      access_key_id: 'c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e',
      status: 'active',
      type: 'app_group',
      public_key: "-----BEGIN CERTIFICATE-----\n
      MIIDYjCCAkoCCQDHthb1fYOBkDANBgkqhkiG9w0BAQUFADBzMQswCQYDVQQGEwJU\n
      VzEPMA0GA1UECAwGVGFpd2FuMQ8wDQYDVQQHDAZUYWlwZWkxFTATBgNVBAoMDEVj\n
      b3dvcmsgSW5jLjEVMBMGA1UECwwMRWNvd29yayBJbmMuMRQwEgYDVQQDDAtQdXNo\n
      U2VydmljZTAeFw0xNzA3MjAwNTUzMjlaFw0zNzA3MjAwNTUzMjlaMHMxCzAJBgNV\n
      BAYTAlRXMQ8wDQYDVQQIDAZUYWl3YW4xDzANBgNVBAcMBlRhaXBlaTEVMBMGA1UE\n
      CgwMRWNvd29yayBJbmMuMRUwEwYDVQQLDAxFY293b3JrIEluYy4xFDASBgNVBAMM\n
      C1B1c2hTZXJ2aWNlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5gRE\n
      vkmFqckEqbbzmQvP+9txHf1aT48+uexDMb7YpELcb1zeExpYhyIzcCUoOjXLwZIu\n
      IRHXM3Vas82s567OPVpwTS5cYygYff8djUT8AsqB/pkB3zh3iPpLjcPN68bOJs75\n
      ci7aD2UpWxXh9bUvJIK7rxK3r2ejiGNdvE2EOqZaWbt0GDZ85SG8vDi5y8ku4u6+\n
      Vb80lsIHcuDrqRQ4v0kr4F8OxEzhIFztKsBUOY+QRQqvvz3xtK2c3J+fpWDhXdxp\n
      rgV78pOWVaxZU4kQl1Lu1BMh3Mdj5Nrsun9q7KOM3SRyap+3URxDxMz0RUohkl2X\n
      pTvQhwCaFQmE5kIYRQIDAQABMA0GCSqGSIb3DQEBBQUAA4IBAQCazHC1EPRgH+/1\n
      Gu3WC6bwZWoAgvGV7vnlvUQnEr9jztZTQx6YvIQvh5M2mDiMYZXWQYT9OxTpt2qC\n
      ZN8VE6WnZ6prP8LRbmhy1eoq9rELsrUT0GjfU0QIWTH9QUh+bUtVKgGKdMdxQDzn\n
      9OHga8DMWRlwC0qtoR0Dr7Ch1q0bOAw7D45kYvhkhemygZ5A1a+Hmv2AcPPxvz9o\n
      VQ2VFfrPytvDS7y9fG0s7ep7cWPXPy3855TPHBsZwZ56f5zVAD8vj9JbX/cDCP8I\n
      VFzRXuJZuLAjKVOsfb/7oPHUZf31bYg07OHy9mcGbnqpuUMhvjVxk1zWcEArMzmi\n
      LriPOjhv\n
      -----END CERTIFICATE-----\n",
      created_at: '2017-07-18T06:52:47.031Z',
      updated_at: '2017-07-18T06:52:47.031Z'
    }
    access_key = Push::AccessKey.new(attributes)
    @access_keys ||= []
    @access_keys << access_key
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: {
        access_key_id: access_key.access_key_id
      }
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # App Group Access Key - Show / Edit for 569e2004-6ad8-4681-81dd-8769d2ea9b0b
  stub_request(:get, "https://#{ENV['PUSH_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/access_keys/c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e").with(
    query: hash_including({ access_key_id: ENV['PUSH_ACCESS_KEY_ID'] })
  ).to_return{ |request|
    # @app_groups ||= []
    # app_group = @app_groups.find{ |x| x.app_group_id == '569e2004-6ad8-4681-81dd-8769d2ea9b0b' }
    @access_keys ||= []
    access_key = @access_keys.find{ |x| x.access_key_id == 'c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e' }

    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: access_key.serializable_hash
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # App Group Access Key - Update
  stub_request(:put, "https://#{ENV['PUSH_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/access_keys/c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e").to_return{ |request|
    params = Rack::Utils.parse_nested_query(request.body)
    attributes = {
      name: params['name'],
      description: params['description'],
      status: params['status'],
      app_group_id: '569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      app_group_topic_arn: 'arn:aws:sns:us-east-1:567710019248:569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      access_key_id: 'c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e',
      type: 'app_group',
      public_key: "-----BEGIN CERTIFICATE-----\n
      MIIDYjCCAkoCCQDHthb1fYOBkDANBgkqhkiG9w0BAQUFADBzMQswCQYDVQQGEwJU\n
      VzEPMA0GA1UECAwGVGFpd2FuMQ8wDQYDVQQHDAZUYWlwZWkxFTATBgNVBAoMDEVj\n
      b3dvcmsgSW5jLjEVMBMGA1UECwwMRWNvd29yayBJbmMuMRQwEgYDVQQDDAtQdXNo\n
      U2VydmljZTAeFw0xNzA3MjAwNTUzMjlaFw0zNzA3MjAwNTUzMjlaMHMxCzAJBgNV\n
      BAYTAlRXMQ8wDQYDVQQIDAZUYWl3YW4xDzANBgNVBAcMBlRhaXBlaTEVMBMGA1UE\n
      CgwMRWNvd29yayBJbmMuMRUwEwYDVQQLDAxFY293b3JrIEluYy4xFDASBgNVBAMM\n
      C1B1c2hTZXJ2aWNlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5gRE\n
      vkmFqckEqbbzmQvP+9txHf1aT48+uexDMb7YpELcb1zeExpYhyIzcCUoOjXLwZIu\n
      IRHXM3Vas82s567OPVpwTS5cYygYff8djUT8AsqB/pkB3zh3iPpLjcPN68bOJs75\n
      ci7aD2UpWxXh9bUvJIK7rxK3r2ejiGNdvE2EOqZaWbt0GDZ85SG8vDi5y8ku4u6+\n
      Vb80lsIHcuDrqRQ4v0kr4F8OxEzhIFztKsBUOY+QRQqvvz3xtK2c3J+fpWDhXdxp\n
      rgV78pOWVaxZU4kQl1Lu1BMh3Mdj5Nrsun9q7KOM3SRyap+3URxDxMz0RUohkl2X\n
      pTvQhwCaFQmE5kIYRQIDAQABMA0GCSqGSIb3DQEBBQUAA4IBAQCazHC1EPRgH+/1\n
      Gu3WC6bwZWoAgvGV7vnlvUQnEr9jztZTQx6YvIQvh5M2mDiMYZXWQYT9OxTpt2qC\n
      ZN8VE6WnZ6prP8LRbmhy1eoq9rELsrUT0GjfU0QIWTH9QUh+bUtVKgGKdMdxQDzn\n
      9OHga8DMWRlwC0qtoR0Dr7Ch1q0bOAw7D45kYvhkhemygZ5A1a+Hmv2AcPPxvz9o\n
      VQ2VFfrPytvDS7y9fG0s7ep7cWPXPy3855TPHBsZwZ56f5zVAD8vj9JbX/cDCP8I\n
      VFzRXuJZuLAjKVOsfb/7oPHUZf31bYg07OHy9mcGbnqpuUMhvjVxk1zWcEArMzmi\n
      LriPOjhv\n
      -----END CERTIFICATE-----\n",
      created_at: '2017-07-18T06:52:47.031Z',
      updated_at: '2017-07-19T06:52:47.031Z'
    }
    access_key = @access_keys.find{ |x| x.access_key_id == 'c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e' }
    access_key.attributes = attributes
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: {
        access_key_id: access_key.access_key_id
      }
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # Download App Group Access Key c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e.pem
  stub_request(:get, "https://#{ENV['PUSH_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/access_keys/c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e/download").with(
    query: hash_including({ access_key_id: ENV['PUSH_ACCESS_KEY_ID'] })
  ).to_return{ |request|
    response = {
      code: '0000',
      message: 'OK',
      data: {
        download_url: 'https://myzyxel-push.s3-website-us-east-1.amazonaws.com/c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e.pem'
      }
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }
  # Download App Group Access Key c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e.pem
  stub_request(:get, "https://myzyxel-push.s3-website-us-east-1.amazonaws.com/c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e.pem").to_return{ |request|
    # 返回
    {
      headers: {
        'Content-Type' => 'application/x-x509-ca-cert',
        'Content-Length' => '1675'

      },
      body: File.new("#{Rails.root}/features/files/c51b80dc-e3ba-45ac-a8b6-6acf7fb88e7e.pem")
    }
  }
end
