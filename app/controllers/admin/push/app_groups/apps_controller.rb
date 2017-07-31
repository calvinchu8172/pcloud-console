class Admin::Push::AppGroups::AppsController < AdminController

  before_action { authorize! :manage, :push_management }
  before_action :set_app_group
  before_action :set_app_group_app, except: [:index, :new, :create]

  def index
    @apps = Push::App.where(app_group_id: @app_group.app_group_id)
  end

  def show
  end

  def new
    @app = Push::App.new
  end

  def create
    @app = Push::App.new(push_app_params)
    if @app.save
      Log.write(current_user, nil, request.remote_ip, 'create_app', {
        app_group_id: @app_group.app_group_id,
        app_id: @app.id
      })
      redirect_to admin_push_app_group_app_url(@app_group, @app)
    else
      flash.now[:error] = @app.api_error_message if @app.api_error?
      render :new
    end
  end

  def edit
  end

  def update
    if @app.update(push_app_params)
      Log.write(current_user, nil, request.remote_ip, 'update_app', {
        app_group_id: @app_group.app_group_id,
        app_id: @app.id
      })
      redirect_to admin_push_app_group_app_url(@app_group, @app)
    else
      flash.now[:error] = @app.api_error_message if @app.api_error?
      render :edit
    end
  end

  private

  def set_app_group
    @app_group = Push::AppGroup.find(params[:app_group_id])
  end

  def set_app_group_app
    @app = Push::App.find_by(
      app_group_id: params[:app_group_id], id: params[:id]
    )
  end

  def push_app_params
    params.require(:push_app).permit(
      :app_group_id, :name, :description, :platform,
      :bundle_id, :certificate, :private_key,
      :package_name, :api_key
    )
  end
end
