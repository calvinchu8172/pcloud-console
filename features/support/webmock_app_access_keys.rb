Before '@webmock' do
  # App Access Keys - Index
  stub_request(:get, "https://#{ENV['PUSH_CONSOLE_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46/access_keys").with(
    query: hash_including({ access_key_id: ENV['CONSOLE_ACCESS_KEY_ID'] })
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

  # App Access Key - Create
  stub_request(:post, "https://#{ENV['PUSH_CONSOLE_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46/access_keys").to_return{ |request|
    params = Rack::Utils.parse_nested_query(request.body)
    attributes = {
      name: params['name'],
      description: params['description'],
      app_group_id: '569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      app_id: '17ac740b-5c0f-4b55-a90e-1d65ec499a46',
      app_group_topic_arn: 'arn:aws:sns:us-east-1:567710019248:569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      app_topic_arn: 'arn:aws:sns:us-east-1:567710019248:myzyxel-push-alpha-01dd8f4e-df4a-425b-9943-96069c0622aa',
      application_arn: 'arn:aws:sns:us-east-1:567710019248:app/APNS_SANDBOX/myzyxel-push-alpha-01dd8f4e-df4a-425b-9943-96069c0622aa',
      access_key_id: '110ec58a-a0f2-4ac4-8393-c866d813b8d1',
      platform: 'APNS_SANDBOX',
      status: 'active',
      type: 'app',
      public_key: "-----BEGIN CERTIFICATE-----\n
      MIIFQzCCAyugAwIBAgICEAIwDQYJKoZIhvcNAQELBQAwgbAxCzAJBgNVBAYTAlRX\n
      MQ8wDQYDVQQIDAZUYWl3YW4xEDAOBgNVBAcMB0hzaW5DaHUxIjAgBgNVBAoMGVp5\n
      WEVMIGNvbW11bmljYXRpb24gY29ycC4xDTALBgNVBAsMBENBQkMxJTAjBgNVBAMM\n
      HG15WnlYRUxDbG91ZCBpbnRlcm1lZGlhdGUgQ0ExJDAiBgkqhkiG9w0BCQEWFWNs\n
      b3VkYWRtQHp5eGVsLmNvbS50dzAeFw0xNTA1MTMwMzUxMTFaFw0xNTA4MTEwMzUx\n
      MTFaMIGaMQswCQYDVQQGEwJUVzEPMA0GA1UECAwGVGFpd2FuMRAwDgYDVQQHDAdI\n
      c2luQ2h1MSIwIAYDVQQKDBlaeVhFTCBjb21tdW5pY2F0aW9uIGNvcnAuMQ0wCwYD\n
      VQQLDARDQUJDMQ8wDQYDVQQDDAZBcHBEZXYxJDAiBgkqhkiG9w0BCQEWFWNsb3Vk\n
      YWRtQHp5eGVsLmNvbS50dzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB\n
      AN9WcIRlMya4yJ8XOMHsv5XsoZurDLfJOMNDYRS0Q/HSrdXcnGHNX4HuCvjEweXo\n
      Ku4vuv+A1s8qWqq3UZ4kNWWFOrFG+HPD1UD8j8wF3bAeZti91Gt9JBoR3Z934SZy\n
      uJlk6CXRHdYxdsjKVJjJ/sxcwLeWjppvO6ZaPYkPKLPDj0BildylsMWqfVqo64/R\n
      Y8N27MR6wCQPBbXrY452wDXnL5l/A1ro7EyOhEFKif+H2XTapfjRtjcIvdV174Yo\n
      gLJMslx3J7XIPQ5VPioRY6qzohV7n815O1GeGu5gCyIafsRmHmrGGQaQOcl1J73l\n
      +1it8zAifVoKMMNaadCB/mECAwEAAaN7MHkwCQYDVR0TBAIwADAsBglghkgBhvhC\n
      AQ0EHxYdT3BlblNTTCBHZW5lcmF0ZWQgQ2VydGlmaWNhdGUwHQYDVR0OBBYEFHM1\n
      ZBqsiFBU8ahaqV3F3kKcY0izMB8GA1UdIwQYMBaAFNBx+rl/NYLomZsDoTPHWCkH\n
      SH4mMA0GCSqGSIb3DQEBCwUAA4ICAQDVrvzAtv3zC9VoqZidnG3jRogVFgMTqeZG\n
      kkZGmrU8VeJ/Xl7Yov9CdP0vT80x9YwSrqrvTQ/UQ8DePaUYhjAuDP9zokBd6rFO\n
      9uM+2Ym/bGNx7zKWpj5KByt2fGJuS23S67y0qttSISoPktsAXsfk61V/ZVCFrNKV\n
      qLbc5Ra73ga36BRL/4ip3/04+q7QIKQNd5VRh48Ei927rU5nj6lfQZWea716SjCO\n
      /a/ABZkRlkVJeZRWY1yCmR2eKTqRgcin3sjwNpZlAbCoqMuuUPb3X9t1JsmVS89r\n
      v5qtltt5Tkoq8TuMeDraCw/u1duG9bLwdJV+8T2UUjs9ra2OQOCuTmU10U5VaJBR\n
      +Yy3uiO80gadNgTEcrEn04Q85counkGSFFOYxfv+ZunaJ/EWm6iZ0sfCKhro09xT\n
      XBc1uLhJsE9Yk3VPkoVW8wNyk86QRxo2SoHI17OCQHG0nvEnqpznRnOcyexK9yFR\n
      uD+YowSVFC5xPj7LEZLB3SdRSouG+I+JOXXIG7mlG62oD0KW74nZrhMQZw+V0or3\n
      FYNBCEH7EzRRfIVpjLDX6Y7UIWmNtenPCaGXJXdKL+a1cn/BTLQVOQRJPQanz2fx\n
      RuXBx8MVep/Ot2wyuACj34Z1ozJ5OVBKuhcWHbRSH0PLEOi0o1jGgEA4mXdXZHO9\n
      QBzeRHk0vw==\n
      -----END CERTIFICATE-----\n",
      created_at: '2017-07-14T02:56:42.276Z',
      updated_at: '2017-07-18T01:48:48.008Z'
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

  # App Access Key - Show / Edit for 569e2004-6ad8-4681-81dd-8769d2ea9b0b
  stub_request(:get, "https://#{ENV['PUSH_CONSOLE_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46/access_keys/110ec58a-a0f2-4ac4-8393-c866d813b8d1").with(
    query: hash_including({ access_key_id: ENV['CONSOLE_ACCESS_KEY_ID'] })
  ).to_return{ |request|
    # @app_groups ||= []
    # app_group = @app_groups.find{ |x| x.app_group_id == '569e2004-6ad8-4681-81dd-8769d2ea9b0b' }
    @access_keys ||= []
    access_key = @access_keys.find{ |x| x.access_key_id == '110ec58a-a0f2-4ac4-8393-c866d813b8d1' }

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

  # App Access Key - Update
  stub_request(:put, "https://#{ENV['PUSH_CONSOLE_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46/access_keys/110ec58a-a0f2-4ac4-8393-c866d813b8d1").to_return{ |request|
    params = Rack::Utils.parse_nested_query(request.body)
    attributes = {
      name: params['name'],
      description: params['description'],
      status: params['status'],
      app_group_id: '569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      app_id: '17ac740b-5c0f-4b55-a90e-1d65ec499a46',
      app_group_topic_arn: 'arn:aws:sns:us-east-1:567710019248:569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      app_topic_arn: 'arn:aws:sns:us-east-1:567710019248:myzyxel-push-alpha-01dd8f4e-df4a-425b-9943-96069c0622aa',
      application_arn: 'arn:aws:sns:us-east-1:567710019248:app/APNS_SANDBOX/myzyxel-push-alpha-01dd8f4e-df4a-425b-9943-96069c0622aa',
      access_key_id: '110ec58a-a0f2-4ac4-8393-c866d813b8d1',
      platform: 'APNS_SANDBOX',
      type: 'app',
      public_key: "-----BEGIN CERTIFICATE-----\n
      MIIFQzCCAyugAwIBAgICEAIwDQYJKoZIhvcNAQELBQAwgbAxCzAJBgNVBAYTAlRX\n
      MQ8wDQYDVQQIDAZUYWl3YW4xEDAOBgNVBAcMB0hzaW5DaHUxIjAgBgNVBAoMGVp5\n
      WEVMIGNvbW11bmljYXRpb24gY29ycC4xDTALBgNVBAsMBENBQkMxJTAjBgNVBAMM\n
      HG15WnlYRUxDbG91ZCBpbnRlcm1lZGlhdGUgQ0ExJDAiBgkqhkiG9w0BCQEWFWNs\n
      b3VkYWRtQHp5eGVsLmNvbS50dzAeFw0xNTA1MTMwMzUxMTFaFw0xNTA4MTEwMzUx\n
      MTFaMIGaMQswCQYDVQQGEwJUVzEPMA0GA1UECAwGVGFpd2FuMRAwDgYDVQQHDAdI\n
      c2luQ2h1MSIwIAYDVQQKDBlaeVhFTCBjb21tdW5pY2F0aW9uIGNvcnAuMQ0wCwYD\n
      VQQLDARDQUJDMQ8wDQYDVQQDDAZBcHBEZXYxJDAiBgkqhkiG9w0BCQEWFWNsb3Vk\n
      YWRtQHp5eGVsLmNvbS50dzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB\n
      AN9WcIRlMya4yJ8XOMHsv5XsoZurDLfJOMNDYRS0Q/HSrdXcnGHNX4HuCvjEweXo\n
      Ku4vuv+A1s8qWqq3UZ4kNWWFOrFG+HPD1UD8j8wF3bAeZti91Gt9JBoR3Z934SZy\n
      uJlk6CXRHdYxdsjKVJjJ/sxcwLeWjppvO6ZaPYkPKLPDj0BildylsMWqfVqo64/R\n
      Y8N27MR6wCQPBbXrY452wDXnL5l/A1ro7EyOhEFKif+H2XTapfjRtjcIvdV174Yo\n
      gLJMslx3J7XIPQ5VPioRY6qzohV7n815O1GeGu5gCyIafsRmHmrGGQaQOcl1J73l\n
      +1it8zAifVoKMMNaadCB/mECAwEAAaN7MHkwCQYDVR0TBAIwADAsBglghkgBhvhC\n
      AQ0EHxYdT3BlblNTTCBHZW5lcmF0ZWQgQ2VydGlmaWNhdGUwHQYDVR0OBBYEFHM1\n
      ZBqsiFBU8ahaqV3F3kKcY0izMB8GA1UdIwQYMBaAFNBx+rl/NYLomZsDoTPHWCkH\n
      SH4mMA0GCSqGSIb3DQEBCwUAA4ICAQDVrvzAtv3zC9VoqZidnG3jRogVFgMTqeZG\n
      kkZGmrU8VeJ/Xl7Yov9CdP0vT80x9YwSrqrvTQ/UQ8DePaUYhjAuDP9zokBd6rFO\n
      9uM+2Ym/bGNx7zKWpj5KByt2fGJuS23S67y0qttSISoPktsAXsfk61V/ZVCFrNKV\n
      qLbc5Ra73ga36BRL/4ip3/04+q7QIKQNd5VRh48Ei927rU5nj6lfQZWea716SjCO\n
      /a/ABZkRlkVJeZRWY1yCmR2eKTqRgcin3sjwNpZlAbCoqMuuUPb3X9t1JsmVS89r\n
      v5qtltt5Tkoq8TuMeDraCw/u1duG9bLwdJV+8T2UUjs9ra2OQOCuTmU10U5VaJBR\n
      +Yy3uiO80gadNgTEcrEn04Q85counkGSFFOYxfv+ZunaJ/EWm6iZ0sfCKhro09xT\n
      XBc1uLhJsE9Yk3VPkoVW8wNyk86QRxo2SoHI17OCQHG0nvEnqpznRnOcyexK9yFR\n
      uD+YowSVFC5xPj7LEZLB3SdRSouG+I+JOXXIG7mlG62oD0KW74nZrhMQZw+V0or3\n
      FYNBCEH7EzRRfIVpjLDX6Y7UIWmNtenPCaGXJXdKL+a1cn/BTLQVOQRJPQanz2fx\n
      RuXBx8MVep/Ot2wyuACj34Z1ozJ5OVBKuhcWHbRSH0PLEOi0o1jGgEA4mXdXZHO9\n
      QBzeRHk0vw==\n
      -----END CERTIFICATE-----\n",
      created_at: '2017-07-14T02:56:42.276Z',
      updated_at: '2017-07-19T01:48:48.008Z'
    }
    access_key = @access_keys.find{ |x| x.access_key_id == '110ec58a-a0f2-4ac4-8393-c866d813b8d1' }
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

  # Download App Access Key 110ec58a-a0f2-4ac4-8393-c866d813b8d1.pem
  stub_request(:get, "https://#{ENV['PUSH_CONSOLE_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46/access_keys/110ec58a-a0f2-4ac4-8393-c866d813b8d1/download").with(
    query: hash_including({ access_key_id: ENV['CONSOLE_ACCESS_KEY_ID'] })
  ).to_return{ |request|
    response = {
      code: '0000',
      message: 'OK',
      data: {
        download_url: 'https://myzyxel-push.s3-website-us-east-1.amazonaws.com/110ec58a-a0f2-4ac4-8393-c866d813b8d1.pem'
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
  stub_request(:get, "https://myzyxel-push.s3-website-us-east-1.amazonaws.com/110ec58a-a0f2-4ac4-8393-c866d813b8d1.pem").to_return{ |request|
    # 返回
    {
      headers: {
        'Content-Type' => 'application/x-x509-ca-cert',
        'Content-Length' => '1675'

      },
      body: File.new("#{Rails.root}/features/files/110ec58a-a0f2-4ac4-8393-c866d813b8d1.pem")
    }
  }
end