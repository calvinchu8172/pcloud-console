class ApplicationController < ActionController::Base
  include TimeZone

  protect_from_forgery with: :exception

end
