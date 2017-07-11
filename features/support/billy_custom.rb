Before '@proxy' do
  proxy.stub('http://www.google.com/').and_return(text: 'I am faker website!')

  # OAuth - Authorize 頁面
  proxy.stub("#{Rails.configuration.omniauth_myzyxel[:provider_url]}/oauth/authorize").and_return(
    Proc.new { |params, headers, body|
      params = params.inject({}) do |h, (k,v)|
        h[k] = v[0]
        h
      end
      if @current_resource_owner
        # 取得 oauth_authorize_template
        oauth_authorize_template = File.read(
          Rails.root.join('features','support','oauth', 'authorize.html')
        )
        # 使用 Liquid parse oauth_authorize_template
        oauth_authorize = Liquid::Template.parse(oauth_authorize_template)
        # 返回 oauth_authorize_html
        {
          body: oauth_authorize.render(params.merge(
            { 'email' => @current_resource_owner.email }
          )),
          content_type: 'text/html'
        }
      else
        @stored_location = "#{Rails.configuration.omniauth_myzyxel[:provider_url]}/oauth/authorize?#{params.to_query}"
        { redirect_to: "#{Rails.configuration.omniauth_myzyxel[:provider_url]}/users/sign_in" }
      end
    }
  )
  # OAuth - 送出 Authorize 頁面表單
  proxy.stub("#{Rails.configuration.omniauth_myzyxel[:provider_url]}/oauth/authorize", method: 'post').and_return(
    Proc.new { |params, headers, body|
      # 從 body 取得 params
      params = Rack::Utils.parse_nested_query(body).deep_symbolize_keys
      # 從 params 取得參數
      client_id     = params[:client_id]
      redirect_uri  = params[:redirect_uri]
      response_type = params[:response_type]
      state         = params[:state]
      commit        = params[:commit]
      # 指定 grant_code
      grant_code    = '1f0618afbc735c766359e07ebccbd435e9c6388e2195d8d76e0eb758639a4a15'
      if commit == 'Authorize'
        # 檢查 client_id 和 response_type
        if client_id == Rails.configuration.omniauth_myzyxel[:client_id] && response_type == 'code'
          { redirect_to: "#{redirect_uri}?code=#{grant_code}&state=#{state}" }
        else
          { redirect_to: "#{redirect_uri}?error=access_denied&error_description=invalid_credentials" }
        end
      elsif commit == 'Deny'
        { redirect_to: "#{redirect_uri}?error=access_denied&error_description=擁有者或認證伺服器拒絕此需求" }
      end
    }
  )
  # OAuth - Sign In 頁面
  proxy.stub("#{Rails.configuration.omniauth_myzyxel[:provider_url]}/users/sign_in").and_return(
    Proc.new { |params, headers, body|
      # 取得 oauth_sign_in_template
      oauth_sign_in_template = File.read(
        Rails.root.join('features','support','oauth', 'sign_in.html')
      )
      # 返回 oauth_authorize_html
      {
        body: oauth_sign_in_template,
        content_type: 'text/html'
      }
    }
  )
  # OAuth - 送出 Sign In 頁面表單
  proxy.stub("#{Rails.configuration.omniauth_myzyxel[:provider_url]}/users/sign_in", method: 'post').and_return(
    Proc.new { |params, headers, body|
      # 從 body 取得 params
      params = Rack::Utils.parse_nested_query(body).deep_symbolize_keys
      @users ||= []
      @users << params[:user][:email] unless @users.include? params[:user][:email]
      @current_resource_owner = OpenStruct.new(
        id: @users.index(params[:user][:email]) + 1,
        email: params[:user][:email]
      )
      # 轉址至 Authorize 頁面
      { redirect_to: @stored_location }
    }
  )
  # OAuth - 登出頁面
  proxy.stub("#{Rails.configuration.omniauth_myzyxel[:provider_url]}/oauth/logout").and_return(
    Proc.new { |params, headers, body|
      # 取得 params
      params = params.inject({}) do |h, (k,v)|
        h[k] = v[0]
        h
      end
      # 清空 @current_resource_owner
      @current_resource_owner = nil
      # 轉址至 logout_redirect_uri 頁面
      { redirect_to: params['logout_redirect_uri'] }
    }
  )
end
