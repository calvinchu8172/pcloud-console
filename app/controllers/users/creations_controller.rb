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
      if resource.errors.empty?
        Log.write(current_user, resource, request.remote_ip, 'create_user')
      end
    end
  end

  protected

    def after_invite_path_for(resource)
      admin_users_url
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:invite, keys: [{ group_ids: [] }])
    end

    def translation_scope
      'devise.creations'
    end
end
