class Admin::Push::AppGroups::Apps::AccessKeysController < AdminController

  before_action { authorize! :manage, :push_management }
  before_action :set_app_group
  before_action :set_app_group_app, except: [:index]
  before_action :set_app_group_app_access_key, except: [:new, :create]

  def show
  end

  def new
    @access_key = Push::AccessKey.new
  end

  def create
    @access_key = Push::AccessKey.new(push_access_key_params)
    if @access_key.save
      Log.write(current_user, nil, request.remote_ip, 'create_app_access_key', {
        app_group_id: @app_group.app_group_id,
        app_id: @app.app_id,
        access_key_id: @access_key.access_key_id
      })
      redirect_to admin_push_app_group_app_access_key_url(@app_group, @app, @access_key)
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
      app_group_id: params[:app_group_id], app_id: params[:app_id]
    )
  end

  def set_app_group_app_access_key
    @access_key = Push::AccessKey.find_by(
      app_group_id: params[:app_group_id],
      app_id: params[:app_id],
      id: params[:id]
    )
  end

  def push_access_key_params
    params.require(:push_access_key).permit(:app_group_id, :app_id, :description, :status)
  end

end