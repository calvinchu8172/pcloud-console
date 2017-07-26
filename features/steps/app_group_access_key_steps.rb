Given /^Push Server has an App Group Access Key data as below:$/ do |app_group_access_key_json|
  access_key = Push::AccessKey.new(JSON.parse(app_group_access_key_json))
  @access_keys ||= []
  @access_keys << access_key
end