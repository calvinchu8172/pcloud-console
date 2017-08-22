Before '@webmock' do
  # PCloud User - Revoke
  stub_request(:put, "https://#{ENV['PCLOUD_API_HOST']}/console/user/revoke").to_return{ |request|
    params = Rack::Utils.parse_nested_query(request.body)
    # binding.pry
    attributes = {
      email: params['email']
    }
    user = Pcloud::UserClient.new(attributes)
    @users ||= []
    @users << user
    # 產生 response
    error_response = {
      code: '404.2',
      message: 'User Not Found'
    }
    # 返回
    if params['email'] == 'user@example.com'
      {
        headers: {
          'Content-Type' => 'application/json'
        }
      }
    else
      {
        status: 404,
        headers: {
          'Content-Type' => 'application/json'
        },
        body: error_response.to_json
      }
    end
  }
end