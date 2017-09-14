Given(/^Push Server has an SSO APP data as below:$/) do |sso_app_json|
  sso_app = Pcloud::SsoApp.new(JSON.parse(sso_app_json))
  @sso_apps ||= []
  @sso_apps << sso_app
end
