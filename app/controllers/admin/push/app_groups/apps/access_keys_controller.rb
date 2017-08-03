class Admin::Push::AppGroups::Apps::AccessKeysController < AdminController

  before_action { authorize! :manage, :push_management }
  before_action :set_app_group
  before_action :set_app_group_app, except: [:index]
  before_action :set_app_group_app_access_key

  def show
  end

  def new
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

end