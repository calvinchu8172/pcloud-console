class Admin::Push::AppGroupsController < AdminController

  before_action { authorize! :manage, :push_management }

  def index
    @app_groups = Push::AppGroup.all
  end

  def show
    @app_group = Push::AppGroup.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
