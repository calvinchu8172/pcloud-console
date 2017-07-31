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
    puts "***************#{params[:platform]}"
    @app = Push::App.new
  end

  def create
    @app = Push::App.new(push_app_params)
    if @app.save
      Log.write(current_user, nil, request.remote_ip, 'create_app_group_app', {
        app_group_id: @app_group.app_group_id,
        app_id: @app_id
      })
      redirect_to admin_push_app_group_app_url(@app_group, @app)
    else
      render :new
    end
  end

  private

  def set_app_group
    @app_group = Push::AppGroup.find(params[:app_group_id])
  end

  def set_app_group_app
    @app = Push::App.find_by(
      app_group_id: params[:app_group_id],
      id: params[:id]
    )
  end

  def push_app_params
    params.require(:push_app).permit(:app_group_id, :name, :description, :platform, :bundle_id, :certificate, :privateKey,
      :package_name)
  end

end