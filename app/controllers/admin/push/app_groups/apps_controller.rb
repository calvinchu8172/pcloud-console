class Admin::Push::AppGroups::AppsController < AdminController

  before_action { authorize! :manage, :push_management }
  before_action :set_app_group
  before_action :set_app_group_app, except: [:index]

  def index
    @apps = Push::App.where(app_group_id: @app_group.app_group_id)
  end

  def show
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
    params.require(:push_app).permit(:app_group_id, :name, :description)
  end

end