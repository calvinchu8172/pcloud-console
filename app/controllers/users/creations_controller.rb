class Users::CreationsController < Devise::InvitationsController

  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    # CanCanCan
    authorize! :create, User

    super
  end

  def create
    # CanCanCan
    authorize! :create, User

    super do |resource|
      # 紀錄新增人員事件
      Log.write(current_user, resource, request.remote_ip, 'create_user') if resource.errors.empty?
    end
  end

  def update
    super do |resource|
      # 紀錄接受新增事件
      Log.write(resource, resource.invited_by, resource, request.remote_ip, 'accept_creation') if resource.errors.empty?
    end
  end

  def after_invite_path_for(resource)
    admin_users_url
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:invite, keys: [{ group_ids: [] }])
    end

    def translation_scope
      'devise.creations'
    end
end
