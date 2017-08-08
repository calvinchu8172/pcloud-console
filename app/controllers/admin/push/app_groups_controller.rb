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
    @apps = Push::App.where(app_group_id: @app_group.app_group_id)
  end

  def send_notification
    access_key = Push::AccessKey.where(app_group_id: @app_group.app_group_id).first
    private_key = Net::HTTP.get(URI.parse(access_key.download_url))
    notification = Push::NotificationClient.new(
      access_key_id: access_key.access_key_id,
      private_key: private_key
    )
    response = notification.personal(
      title: params[:title],
      body: params[:body],
      user_ids: params[:user_ids].join(',')
    )
    flash[:notice] = t('push.app_group.messages.notification_success', response: response.to_json)
    redirect_to notification_admin_push_app_group_url(@app_group)
  rescue
    flash.now[:error] = I18n.t('common.messages.error')
    render :notification
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
