class ApplicationController < ActionController::Base
  include TimeZone

  protect_from_forgery with: :exception

  # for CanCanCan AccessDenied
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_url, notice: t('common.messages.unauthorized') }
      format.json { head :forbidden, content_type: 'text/html' }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  private

  def after_sign_in_path_for(resource)
    Log.write(resource, nil, request.remote_ip, 'user_sign_in')
    if resource.anonymous?
      flash[:notice] = t('common.messages.all_unauthorized')
      return root_url
    end
    super
  end
end
