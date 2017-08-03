Before '@webmock' do
  # App - Index
  stub_request(:get, "https://#{ENV['PUSH_CONSOLE_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps").with(
    query: hash_including({ access_key_id: ENV['CONSOLE_ACCESS_KEY_ID'] })
  ).to_return{ |request|
    @apps ||= []
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: @apps.map(&:serializable_hash)
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # App - Create
  stub_request(:post, "https://#{ENV['PUSH_CONSOLE_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps").to_return{ |request|
    params = Rack::Utils.parse_nested_query(request.body)
    # binding.pry
    attributes = {
      name: params['name'],
      description: params['description'],
      platform: params['platform'],
      app_group_id: '569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      app_group_topic_arn: 'arn:aws:sns:us-east-1:567710019248:myzyxel-push-alpha-569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      application_arn: 'arn:aws:sns:us-east-1:567710019248:app/APNS/17ac740b-5c0f-4b55-a90e-1d65ec499a46',
      topic_arn: 'arn:aws:sns:us-east-1:567710019248:myzyxel-push-alpha-01dd8f4e-df4a-425b-9943-96069c0622aa',
      app_id: '01dd8f4e-df4a-425b-9943-96069c0622aa',
      status: 'active',
      bundle_id: params['bundle_id'],
      package_name: params['package_name'],
      locales: ['en'],
      created_at: '2017-07-18T06:52:47.031Z',
      updated_at: '2017-07-18T06:52:47.031Z'
    }
    app = Push::App.new(attributes)
    @apps ||= []
    @apps << app
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: {
        app_id: app.app_id
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

  # App Group App - Show / Edit for 569e2004-6ad8-4681-81dd-8769d2ea9b0b
  stub_request(:get, "https://#{ENV['PUSH_CONSOLE_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46").with(
    query: hash_including({ access_key_id: ENV['CONSOLE_ACCESS_KEY_ID'] })
  ).to_return{ |request|
    # @app_groups ||= []
    # app_group = @app_groups.find{ |x| x.app_group_id == '569e2004-6ad8-4681-81dd-8769d2ea9b0b' }
    @apps ||= []
    app = @apps.find{ |x| x.app_id == '17ac740b-5c0f-4b55-a90e-1d65ec499a46' }

    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: app.serializable_hash
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # App Group App - Show / Edit for 569e2004-6ad8-4681-81dd-8769d2ea9b0b
  stub_request(:get, "https://#{ENV['PUSH_CONSOLE_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/01dd8f4e-df4a-425b-9943-96069c0622aa").with(
    query: hash_including({ access_key_id: ENV['CONSOLE_ACCESS_KEY_ID'] })
  ).to_return{ |request|
    # @app_groups ||= []
    # app_group = @app_groups.find{ |x| x.app_group_id == '569e2004-6ad8-4681-81dd-8769d2ea9b0b' }
    @apps ||= []
    app = @apps.find{ |x| x.app_id == '01dd8f4e-df4a-425b-9943-96069c0622aa' }

    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: app.serializable_hash
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # App Group App - Show / Edit for 569e2004-6ad8-4681-81dd-8769d2ea9b0b
  stub_request(:get, "https://#{ENV['PUSH_CONSOLE_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/419b0e28-a418-4e79-8dda-72cafbf4b036").with(
    query: hash_including({ access_key_id: ENV['CONSOLE_ACCESS_KEY_ID'] })
  ).to_return{ |request|
    # @app_groups ||= []
    # app_group = @app_groups.find{ |x| x.app_group_id == '569e2004-6ad8-4681-81dd-8769d2ea9b0b' }
    @apps ||= []
    app = @apps.find{ |x| x.app_id == '419b0e28-a418-4e79-8dda-72cafbf4b036' }

    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: app.serializable_hash
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # App Group App - Update
  stub_request(:put, "https://#{ENV['PUSH_CONSOLE_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/17ac740b-5c0f-4b55-a90e-1d65ec499a46").to_return{ |request|
    params = Rack::Utils.parse_nested_query(request.body)
    attributes = {
      name: params['name'],
      description: params['description'],
      status: params['status'],
      app_group_id: '569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      app_group_topic_arn: 'arn:aws:sns:us-east-1:567710019248:myzyxel-push-alpha-569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      application_arn: 'arn:aws:sns:us-east-1:567710019248:app/APNS_SANDBOX/17ac740b-5c0f-4b55-a90e-1d65ec499a46',
      topic_arn: 'arn:aws:sns:us-east-1:567710019248:myzyxel-push-alpha-17ac740b-5c0f-4b55-a90e-1d65ec499a46',
      app_id: '17ac740b-5c0f-4b55-a90e-1d65ec499a46',
      bundle_id: params['bundle_id'],
      certificate: params['certificate'],
      private_key: params['private_key'],
      package_name: params['package_name'],
      api_key: params['api_key'],
      locales: ['en'],
      created_at: '2017-07-18T06:52:47.031Z',
      updated_at: '2017-07-20T06:52:47.031Z'
    }
    app = @apps.find{ |x| x.app_id == '17ac740b-5c0f-4b55-a90e-1d65ec499a46' }
    app.attributes = attributes
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: {
        app_id: app.app_id
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

  # App Group App - Update
  stub_request(:put, "https://#{ENV['PUSH_CONSOLE_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/01dd8f4e-df4a-425b-9943-96069c0622aa").to_return{ |request|
    params = Rack::Utils.parse_nested_query(request.body)
    attributes = {
      name: params['name'],
      description: params['description'],
      status: params['status'],
      app_group_id: '569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      app_group_topic_arn: 'arn:aws:sns:us-east-1:567710019248:myzyxel-push-alpha-569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      application_arn: 'arn:aws:sns:us-east-1:567710019248:app/APNS/01dd8f4e-df4a-425b-9943-96069c0622aa',
      topic_arn: 'arn:aws:sns:us-east-1:567710019248:myzyxel-push-alpha-01dd8f4e-df4a-425b-9943-96069c0622aa',
      app_id: '01dd8f4e-df4a-425b-9943-96069c0622aa',
      bundle_id: params['bundle_id'],
      certificate: params['certificate'],
      private_key: params['private_key'],
      package_name: params['package_name'],
      api_key: params['api_key'],
      locales: ['en'],
      created_at: '2017-07-18T06:52:47.031Z',
      updated_at: '2017-07-21T06:52:47.031Z'
    }
    app = @apps.find{ |x| x.app_id == '01dd8f4e-df4a-425b-9943-96069c0622aa' }
    app.attributes = attributes
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: {
        app_id: app.app_id
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

  # App Group App - Update
  stub_request(:put, "https://#{ENV['PUSH_CONSOLE_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps/419b0e28-a418-4e79-8dda-72cafbf4b036").to_return{ |request|
    params = Rack::Utils.parse_nested_query(request.body)
    attributes = {
      name: params['name'],
      description: params['description'],
      status: params['status'],
      app_group_id: '569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      app_group_topic_arn: 'arn:aws:sns:us-east-1:567710019248:myzyxel-push-alpha-569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      application_arn: 'arn:aws:sns:us-east-1:567710019248:app/GCM/419b0e28-a418-4e79-8dda-72cafbf4b036',
      topic_arn: 'arn:aws:sns:us-east-1:567710019248:myzyxel-push-alpha-419b0e28-a418-4e79-8dda-72cafbf4b036',
      app_id: '419b0e28-a418-4e79-8dda-72cafbf4b036',
      bundle_id: params['bundle_id'],
      certificate: params['certificate'],
      private_key: params['private_key'],
      package_name: params['package_name'],
      api_key: params['api_key'],
      locales: ['en'],
      created_at: '2017-07-18T06:52:47.031Z',
      updated_at: '2017-07-22T06:52:47.031Z'
    }
    app = @apps.find{ |x| x.app_id == '419b0e28-a418-4e79-8dda-72cafbf4b036' }
    app.attributes = attributes
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: {
        app_id: app.app_id
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

end
