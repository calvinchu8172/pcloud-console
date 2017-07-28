Given /^Push Server has an App Group App data as below:$/ do |app_group_app_json|
  app = Push::App.new(JSON.parse(app_group_app_json))
  @apps ||= []
  @apps << app
end