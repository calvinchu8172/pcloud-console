class Admin::Push::AppGroups::AccessKeysController < AdminController

  before_action { authorize! :manage, :push_management }
  before_action :set_app_group, only: [:new, :create]
  before_action :set_app_group_access_key, only: [:show, :edit, :update]

  def show
  end

  def new
    @access_key = Push::AccessKey.new
  end

  def edit
  end

  def create
    @access_key = Push::AccessKey.new(push_app_group_access_key_params)
    if @access_key.save
      Log.write(current_user, nil, request.remote_ip, 'create_app_group_access_key', {
        app_group_id: @app_group.app_group_id,
        access_key_id: @access_key.access_key_id
      })
      # redirect_to admin_push_app_group_url(@app_group)
      redirect_to admin_push_app_group_access_key_url(@app_group, @access_key)
    else
      render :new
    end
  end

  private

  def set_app_group
    @app_group = Push::AppGroup.find(params[:app_group_id])
  end

  def set_app_group_access_key
    @app_group = Push::AppGroup.find(params[:app_group_id])
    @access_key = Push::AccessKey.find(params[:app_group_id], params[:id])
  end

  def push_app_group_access_key_params
    params.require(:push_access_key).permit(:name, :description, :app_group_id)
  end

end