class Admin::Pcloud::SsoAppsController < AdminController
  before_action { authorize! :manage, :pcloud_management }

  def index
    @sso_apps = Pcloud::SsoApp.all
  end

  def show
    @sso_app = Pcloud::SsoApp.find(params[:client_id])
  end

  def new
  end

  def edit
  end

  def destroy
  end

end