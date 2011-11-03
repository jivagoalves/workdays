def sign_in(user)
  visit signin_path
  fill_in 'User name', :with => user.username
  fill_in 'Password', :with => user.password
  click_button 'Sign in'
end

Given /^I am signed in as (.*)$/ do |firstname|
  @user = Factory.build(:user, :firstname => firstname)
  @user.save_without_session_maintenance
  sign_in(@user)
end