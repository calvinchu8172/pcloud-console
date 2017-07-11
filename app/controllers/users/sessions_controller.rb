class Users::SessionsController < Devise::SessionsController

  def destroy
    resource = current_user
    remote_ip = request.remote_ip
    # 取得 access_token
    access_token = session[:credentials]['token']
    # 取得 logout_redirect_uri
    uri = URI.parse(request.url.gsub(/\?.*$/, ''))
    uri.path = ''
    logout_redirect_uri = uri.to_s
    # 生成 oauth_logout_url
    oauth_logout_url = "#{Rails.configuration.omniauth_myzyxel[:provider_url]}/oauth/logout"
    oauth_logout_query_strings = {
      access_token: access_token,
      logout_redirect_uri: logout_redirect_uri
    }.to_query
    # 清空登入 session
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    # 紀錄
    Log.write(resource, nil, remote_ip, 'user_sign_out')
    # 登出 accounts
    redirect_to "#{oauth_logout_url}?#{oauth_logout_query_strings}"
  end
end
