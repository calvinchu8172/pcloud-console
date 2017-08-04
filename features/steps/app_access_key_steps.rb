Given /^Push Server has an App Access Key data as below:$/ do |app_access_key_json|
  access_key = Push::AccessKey.new(JSON.parse(app_access_key_json))
  @access_keys ||= []
  @access_keys << access_key
end