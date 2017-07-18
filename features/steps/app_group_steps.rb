Given /^Push Server has an App Group data as below:$/ do |app_group_json|
  app_group = Push::AppGroup.new(JSON.parse(app_group_json))
  @app_groups ||= []
  @app_groups << app_group
end