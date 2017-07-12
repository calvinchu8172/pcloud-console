Given /^the super admin has already signed up$/ do
  @super_admin = FactoryGirl.create(:super_admin)
  Log.write(@super_admin, nil, '127.0.0.1', 'super_admin_sign_up')
end

Given /^the (.+) has already signed in$/ do |username|
  username = username.parameterize.underscore
  @current_user = instance_variable_get("@#{username}")
  login_as @current_user
  Log.write(@current_user, nil, '127.0.0.1', 'user_sign_in')
  visit '/'
end

Given /^the (.+) has already been created by (.+)$/ do |username, creator|
  username = username.parameterize.underscore
  creator = instance_variable_get("@#{creator.parameterize.underscore}")
  user = FactoryGirl.create(username)
  user.update(
    invitation_created_at: Time.now,
    invited_by: creator
  )
  instance_variable_set("@#{username}", user)
  Log.write(creator, user, '127.0.0.1', 'create_user')
end
