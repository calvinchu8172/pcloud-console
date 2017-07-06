class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # for CanCanCan AccessDenied
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: t('common.messages.unauthorized') }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  private

  def after_sign_in_path_for(resource)
    Log.write(resource, resource, request.remote_ip, 'user_sign_in')
    if resource.anonymous?
      flash[:notice] = t('common.messages.all_unauthorized')
      return root_url
    end

    super
  end
end
