class Admin::Push::AppGroupsController < AdminController

  before_action { authorize! :manage, :push_management }
  before_action :set_app_group, only: [:show, :edit, :update]

  def index
    @app_groups = Push::AppGroup.all
  end

  def show
  end

  def new
    @app_group = Push::AppGroup.new
  end

  def create
    @app_group = Push::AppGroup.new(push_app_group_params)
    if @app_group.save
      Log.write(current_user, nil, request.remote_ip, 'create_app_group', {
        app_group_id: @app_group.app_group_id
      })
      redirect_to admin_push_app_group_url(@app_group)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @app_group.update(push_app_group_params)
      Log.write(current_user, nil, request.remote_ip, 'update_app_group', {
        app_group_id: @app_group.app_group_id
      })
      redirect_to admin_push_app_group_url(@app_group)
    else
      render :edit
    end
  end

  private

  def set_app_group
    @app_group = Push::AppGroup.find(params[:id])
  end

  def push_app_group_params
    params.require(:push_app_group).permit(:name, :description)
  end
end
