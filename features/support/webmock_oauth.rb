Before '@webmock' do
  # stub_request(:post, /url-1/).to_return(body: 'success')
  # stub_request(:post, /url-2/).to_return{ |request|
  # }
  # OAuth - 取得 Access Token
  stub_request(:post, "#{Rails.configuration.omniauth_myzyxel[:provider_url]}/oauth/token").to_return{ |request|
    # 取得 params 並指定 grant_code, created_at, expired_at
    params = Rack::Utils.parse_nested_query(request.body)
    grant_type    = params['grant_type']
    code          = params['code']
    client_id     = params['client_id']
    client_secret = params['client_secret']
    grant_code    = '1f0618afbc735c766359e07ebccbd435e9c6388e2195d8d76e0eb758639a4a15'
    created_at    = Time.now.to_i
    expired_at    = (Time.now + 6.hours).to_i
    # 檢查 grant_type, code, client_id, client_secret
    if grant_type == 'authorization_code' && code == grant_code &&
      client_id == Rails.configuration.omniauth_myzyxel[:client_id] &&
      client_secret == Rails.configuration.omniauth_myzyxel[:client_secret]

      response = {
        token_type: 'bearer',
        created_at: created_at,
        access_token: '77f84d04df9336385ed04d68a08a4f3bf94cd600b5f9333017ba8a8698ef8bcd',
        refresh_token: '91a4a6b870ab5b76c074e9ab5a4365dab3d64e218688269042659e16d5f9dfe7',
        expires_at: expired_at
      }
    else
      response = {
        error: 'access_denied',
        error_description: 'authentication_failed'
      }
    end
    # 回吐 access token or error message
    { headers: { 'Content-Type' => 'application/json' }, body: response.to_json }
  }
  # OAuth - 取得 User Info
  stub_request(:get, "#{Rails.configuration.omniauth_myzyxel[:provider_url]}/api/v1/my/info").to_return{ |request|
    # 取得 header 中的 access_token
    access_token  = request.headers['Authorization'].split.last
    correct_token = '77f84d04df9336385ed04d68a08a4f3bf94cd600b5f9333017ba8a8698ef8bcd'
    if access_token == correct_token
      user = @current_resource_owner
      data = {
        info: {
          account_id: user.id.to_s,
          email: user.email
        },
        timestamp: Time.now.to_i
      }
      # 將 data 加密產生 response
      response = {
        result: Aescrypt::encrypt(
          Rails.configuration.omniauth_myzyxel[:client_secret],
          data.to_json
        )
      }
    else
      response = { error: 'unauthorized' }
    end
    # 回吐 user info or error message
    { headers: { 'Content-Type' => 'application/json' }, body: response.to_json }
  }
end
