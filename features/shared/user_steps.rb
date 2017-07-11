Given /^the super admin has already signed up$/ do
  @super_admin = FactoryGirl.create(:super_admin)
end

Given /^the (.+) has already signed in$/ do |username|
  username = username.parameterize.underscore
  @current_user = instance_variable_get("@#{username}")
  login_as @current_user
  visit '/'
end

Given /^the (.+) has already been created by (.+)$/ do |user, user_manager|
  user = user.parameterize.underscore
  user_manager = instance_variable_get("@#{user_manager.parameterize.underscore}")

  user_profile = FactoryGirl.create("#{user}_profile")
  user_profile.user.update(
    invitation_created_at: Time.now,
    invitation_sent_at: Time.now,
    invitation_accepted_at: Time.now,
    invited_by: user_manager
  )
  instance_variable_set("@#{user}_profile", user_profile)
  instance_variable_set("@#{user}", user_profile.user)
end
