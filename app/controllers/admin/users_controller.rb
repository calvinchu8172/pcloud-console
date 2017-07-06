class Admin::UsersController < AdminController

  load_and_authorize_resource

  def index
    @users = @users.includes(:profile)
  end

  def show
  end

  def edit
    @user.build_profile if @user.profile.nil?
  end

  def update
    if @user.update(user_params)
      # 紀錄更新人員事件
      Log.write(current_user, @user, request.remote_ip, 'update_user')
      redirect_to admin_user_url(@user), notice: t('user.messages.edit_success', email: @user.email)
    else
      render :edit
    end
  end

  def resend_creation
    @user.invite!
    # 紀錄重寄認證信事件
    Log.write(current_user, @user, request.remote_ip, 'resend_creation')
    redirect_to admin_user_url(@user), notice: t('user.messages.resend_creation_success', email: @user.email)
  end

  def lock
    if @user.lock_access!(send_instructions: false)
      # 紀錄鎖定人員事件
      Log.write(current_user, @user, request.remote_ip, 'lock_user')
      redirect_to admin_user_url(@user), notice: t('user.messages.lock_success', email: @user.email)
    end
  end

  def unlock
    if @user.unlock_access!
      # 紀錄解鎖人員事件
      Log.write(current_user, @user, request.remote_ip, 'unlock_user')
      redirect_to admin_user_url(@user), notice: t('user.messages.unlock_success', email: @user.email)
    end
  end

  private

    def user_params
      params.require(:user).permit(group_ids: [])
    end
end
