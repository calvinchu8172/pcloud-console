class Admin::Pcloud::UsersController < AdminController

  before_action { authorize! :manage, :pcloud_management }

  def revoke
  end

  def revoking
    user = Pcloud::UserClient.new
    certificate_serial = user.certificate_serial
    user.revoke_user(
      email: params[:email],
      certificate_serial: certificate_serial
    )
    Log.write(current_user, nil, request.remote_ip, 'revoke_pcloud_user', {
      pcloud_user_email: params[:email]
    })
    flash[:notice] = I18n.t('pcloud.user.messages.revoke_user_success', user: params[:email])
    redirect_to admin_pcloud_user_revoke_url
  rescue => e
    message = JSON.parse(e.response.body)['message']
    flash.now[:error] = I18n.t('pcloud.user.messages.revoke_user_error', user: params[:email], message: message)
    render :revoke
  end
end
