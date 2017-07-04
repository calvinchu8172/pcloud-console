class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def auth
    user = User.find_or_create_by_omniauth(env['omniauth.auth'])
    if user.persisted?
      # user.update_access_token(env['omniauth.auth'].extra.token)
      if User.super_admin.count == 0
        # 更新 user.profile.role = super_admin
        user.super_admin!
        # 紀錄管理員註冊事件
        Log.write(user, user, request.remote_ip, 'super_admin_sign_up')
        flash[:notice] = t('user.messages.super_admin_sign_up_success', email: user.email)
      end
      sign_in_and_redirect(user, event: :authentication)
    else
      session['devise.omniauth_data'] = env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  User.omniauth_providers.each do |provider|
    alias_method provider, :auth
  end
end
