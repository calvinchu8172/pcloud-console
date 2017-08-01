Before '@webmock' do
  # App Group - Index
  stub_request(:get, "https://#{ENV['PUSH_HOST']}/v1/app_groups").with(
    query: hash_including({ access_key_id: ENV['PUSH_ACCESS_KEY_ID'] })
  ).to_return{ |request|
    @app_groups ||= []
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: @app_groups.map(&:serializable_hash)
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
  stub_request(:post, "https://#{ENV['PUSH_HOST']}/v1/app_groups").to_return{ |request|
    params = Rack::Utils.parse_nested_query(request.body)
    attributes = {
      name: params['name'],
      description: params['description'],
      app_group_id: '569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      topic_arn: 'arn:aws:sns:us-east-1:567710019248:569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      created_at: '2017-07-18T06:52:47.031Z',
      updated_at: '2017-07-18T06:52:47.031Z'
    }
    app_group = Push::AppGroup.new(attributes)
    @app_groups ||= []
    @app_groups << app_group
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: {
        app_group_id: app_group.app_group_id
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
  # App Group - Show / Edit for 569e2004-6ad8-4681-81dd-8769d2ea9b0b
  stub_request(:get, "https://#{ENV['PUSH_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b").with(
    query: hash_including({ access_key_id: ENV['PUSH_ACCESS_KEY_ID'] })
  ).to_return{ |request|
    @app_groups ||= []
    app_group = @app_groups.find{ |x| x.app_group_id == '569e2004-6ad8-4681-81dd-8769d2ea9b0b' }
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: app_group.serializable_hash
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # App Group - Show / Edit for 569e2004-6ad8-4681-81dd-8769d2ea9b0b
  stub_request(:get, "https://#{ENV['PUSH_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b").with(
    query: hash_including({ access_key_id: ENV['PUSH_ACCESS_KEY_ID'] })
  ).to_return{ |request|
    @app_groups ||= []
    app_group = @app_groups.find{ |x| x.app_group_id == '569e2004-6ad8-4681-81dd-8769d2ea9b0b' }
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: app_group.serializable_hash
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # App Group - Update
  stub_request(:put, "https://#{ENV['PUSH_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b").to_return{ |request|
    # binding.pry
    params = Rack::Utils.parse_nested_query(request.body)
    attributes = {
      name: params['name'],
      description: params['description'],
      app_group_id: '569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      topic_arn: 'arn:aws:sns:us-east-1:567710019248:569e2004-6ad8-4681-81dd-8769d2ea9b0b',
      created_at: '2017-07-18T06:52:47.031Z',
      updated_at: '2017-07-19T06:52:47.031Z'
    }
    app_group = @app_groups.find{ |x| x.app_group_id == '569e2004-6ad8-4681-81dd-8769d2ea9b0b' }
    app_group.attributes = attributes
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: {
        app_group_id: app_group.app_group_id
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
