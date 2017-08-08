class Admin::Push::AppGroupsController < AdminController

  before_action { authorize! :manage, :push_management }
  before_action :set_app_group, only: [:show, :edit, :update, :notification, :send_notification]

  def index
    @app_groups = Push::AppGroup.all
  end

  def show
    @access_keys = Push::AccessKey.where(app_group_id: @app_group.app_group_id)
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

  def notification
    @notification = Push::Notification.new
    @apps = Push::App.where(app_group_id: @app_group.app_group_id)
    @notification.app_ids = @apps.map(&:app_id)
    @users = User.all
    access_keys = Push::AccessKey.where(app_group_id: @app_group.app_group_id)
    @access_key = access_keys.first
    download_url = @access_key.download_url
    @private_key = Net::HTTP.get(URI.parse(download_url))

  end

  def send_notification
    response = Push::Notification.send_personal(push_notification_params)
    flash[:notice] = t('push.app_group.titles.notification_success', response: response.to_json)
    redirect_to notification_admin_push_app_group_url(@app_group)
  end

  private

  def set_app_group
    @app_group = Push::AppGroup.find(params[:id])
  end

  def push_app_group_params
    params.require(:push_app_group).permit(:name, :description)
  end

  def push_notification_params
    params.require(:push_notification).permit({ app_ids: [] }, :user_ids, { email: [] }, :title, :body, :access_key_id, :private_key)
  end
end
