class Admin::Pcloud::SsoAppsController < AdminController
  before_action { authorize! :manage, :pcloud_management }

  def index
    @sso_apps = Pcloud::SsoApp.all
  end

  def show
    @sso_app = Pcloud::SsoApp.find(params[:id])
  end

  def new
    @sso_app = Pcloud::SsoApp.new
  end

  def create
    @sso_app = Pcloud::SsoApp.new(sso_app_params)
    if @sso_app.save
      Log.write(current_user, nil, request.remote_ip, 'create_sso_app', {
        id: @sso_app.id,
        name: @sso_app.name
      })
      redirect_to admin_pcloud_sso_app_url(@sso_app.id)
    else
      flash.now[:error] = @sso_app.api_error_message if @sso_app.api_error?
      render :new
    end
  end

  def edit
    @sso_app = Pcloud::SsoApp.find(params[:id])
  end

  def update
    @sso_app = Pcloud::SsoApp.find(params[:id])
    if @sso_app.update(sso_app_params)
      Log.write(current_user, nil, request.remote_ip, 'update_sso_app', {
        id: @sso_app.id,
        name: @sso_app.name
      })
      redirect_to admin_pcloud_sso_app_url(@sso_app.id)
    else
      flash.now[:error] = @sso_app.api_error_message if @sso_app.api_error?
      render :edit
    end
  end

  def destroy
    @sso_app = Pcloud::SsoApp.find(params[:id])
    @sso_app.destroy!
    Log.write(current_user, nil, request.remote_ip, 'delete_sso_app', {
      id: @sso_app.id,
      name: @sso_app.name
    })
    flash[:notice] = "#{@sso_app.name} " + t("common.labels.deleted")
    redirect_to admin_pcloud_sso_apps_url
  end

  def create_table
    @sso_app = Pcloud::SsoApp.find(params[:id])
    if @sso_app.create_ddb_table
      Log.write(current_user, nil, request.remote_ip, 'create_sso_app_table', {
        id: @sso_app.id,
        name: @sso_app.name
      })
      flash[:notice] = "#{@sso_app.name} " + t("pcloud.sso_app.titles.successfully_create_table")
    else
      flash[:error] = @sso_app.api_error_message if @sso_app.api_error?
    end
    redirect_to admin_pcloud_sso_app_url(@sso_app.id)
  end

  private

  def sso_app_params
    params.require(:pcloud_sso_app).permit(:name, :redirect_uri, :scopes, :logout_redirect_uri, :create_table)
  end

end
