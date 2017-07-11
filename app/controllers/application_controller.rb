class ApplicationController < ActionController::Base
  include TimeZone

  protect_from_forgery with: :exception

  # for CanCanCan AccessDenied
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      # format.html { redirect_to main_app.root_url, notice: t('common.messages.unauthorized') }
      # format.html { redirect_to main_app.root_url, notice: t('common.messages.unauthorized') + view_context.link_to(t('common.labels.last'), :back, class: "alert-link alert-link-customize")}
      format.html { redirect_to :back, notice: t('common.messages.unauthorized') }
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
