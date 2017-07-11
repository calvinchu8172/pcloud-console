class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters, if: :devise_controller?

  def edit
  end

  def update
    super do |resource|
      # 紀錄使用者修改個人檔案事件
      if resource.errors.empty?
        Log.write(resource, resource, request.remote_ip, 'update_user')
      end
    end
  end

  protected

  def update_resource(resource, params)
    resource.update(params)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [
      { profile_attributes: [:id, :name] }
    ])
  end
end
