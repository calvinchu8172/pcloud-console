class Users::SessionsController < Devise::SessionsController

  def destroy
    resource = current_user
    remote_ip = request.remote_ip
    # 1. 如果是用 OAuth 登入, 則登出 accounts
    # 2. 如果是正常登入, 則執行正常登出流程, 回到登入頁
    if session[:credentials]
      # 取得 access_token
      access_token = session[:credentials]['token']
      # 取得 logout_redirect_uri
      uri = URI.parse(request.url.gsub(/\?.*$/, ''))
      uri.path = ''
      logout_redirect_uri = uri.to_s
      # 生成 oauth_logout_url
      oauth_logout_url = "#{Rails.configuration.omniauth_myzyxel[:provider_url]}/oauth/logout"
      oauth_logout_query_strings = {
        # access_token: access_token,
        client_id: Rails.configuration.omniauth_myzyxel[:client_id],
        logout_redirect_uri: logout_redirect_uri
      }.to_query
      # 清空登入 session
      Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
      # 紀錄
      Log.write(resource, nil, remote_ip, 'user_sign_out')
      # 登出 accounts
      # binding.pry
      redirect_to "#{oauth_logout_url}?#{oauth_logout_query_strings}"
    else
      # 清空登入 session
      signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
      if signed_out
        set_flash_message! :notice, :signed_out
        # 紀錄
        Log.write(resource, nil, remote_ip, 'user_sign_out')
      end
      # 回到登入頁
      redirect_to new_user_session_url
    end
  end

  # def destroy
  #   resource = current_user
  #   ip = request.remote_ip
  #   super do
  #     Log.write(resource, nil, ip, 'user_sign_out')
  #   end
  # end

end
