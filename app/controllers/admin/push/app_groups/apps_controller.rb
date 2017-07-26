class Admin::Push::AppGroups::AppsController < AdminController

  before_action { authorize! :manage, :push_management }
  before_action :set_app_group

  def index
    @apps = Push::App.where(app_group_id: @app_group.app_group_id)
  end

  private

  def set_app_group
    @app_group = Push::AppGroup.find(params[:app_group_id])
  end

  def push_app_params
    params.require(:push_app).permit(:app_group_id, :name, :description)
  end

end