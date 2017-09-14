Before '@webmock' do
  # SSO App - Index
  stub_request(:get, "https://#{ENV['PCLOUD_API_HOST']}/v1/oauth2/applications").with(
    query: hash_including({ certificate_serial: ENV['CERTIFICATE_SERIAL'] })
  ).to_return{ |request|
    @sso_apps ||= []
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: @sso_apps.map(&:serializable_hash)
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # SSO APP - Create
  stub_request(:post, "https://#{ENV['PCLOUD_API_HOST']}/v1/oauth2/applications").to_return{ |request|
    params = Rack::Utils.parse_nested_query(request.body)
    attributes = {
      id: '1',
      name: params['name'],
      uid: 'c4d67b7f3b7f409b9577796060c81e02abce42529e4005a50fe4239bcb0e34b9',
      secret: 'f0f7ed91dcb3e9fb0b7dcce133acf7b75e9266aea3cb9ced3f55afb7fdec8486',
      redirect_uri: params['redirect_uri'],
      logout_redirect_uri: params['logout_redirect_uri'],
      scopes: params['scopes'].split(' '),
      create_table: params['create_table'],
      created_at: '2017-09-14T06:52:47.031Z',
      updated_at: '2017-09-14T06:52:47.031Z'
    }
    sso_app = Pcloud::SsoApp.new(attributes)
    @sso_apps ||= []
    @sso_apps << sso_app
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: sso_app.serializable_hash
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }
  # SSO APP - Show / Edit for id = 1
  stub_request(:get, "https://#{ENV['PCLOUD_API_HOST']}/v1/oauth2/applications/1").with(
    query: hash_including({ certificate_serial: ENV['CERTIFICATE_SERIAL'] })
  ).to_return{ |request|
    @sso_apps ||= []
    sso_app = @sso_apps.find{ |x| x.id == '1' }
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: sso_app.serializable_hash
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # SSO APP - Update
  stub_request(:put, "https://#{ENV['PCLOUD_API_HOST']}/v1/oauth2/applications/1").to_return{ |request|
    # binding.pry
    params = Rack::Utils.parse_nested_query(request.body)
    attributes = {
      name: params['name'],
      redirect_uri: params['redirect_uri'],
      logout_redirect_uri: params['logout_redirect_uri'],
      scopes: params['scopes'].split(' '),
      created_at: '2017-09-14T02:56:42.276Z',
      updated_at: '2017-09-16T02:56:42.276Z'
    }
    sso_app = @sso_apps.find{ |x| x.id == '1' }
    sso_app.attributes = attributes
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: sso_app.serializable_hash
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # SSO APP - Delete
  stub_request(:delete, "https://#{ENV['PCLOUD_API_HOST']}/v1/oauth2/applications/1").to_return{ |request|
    # 產生 response
    response = {
      code: '0000',
      message: 'OK'
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }

  # SSO APP - Create Table
  stub_request(:post, "https://#{ENV['PCLOUD_API_HOST']}/v1/oauth2/applications/1/create_table").to_return{ |request|
    # 產生 response
    response = {
      code: '0000',
      message: 'OK'
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
