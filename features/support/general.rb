def sign_in(user)
  visit signin_path
  fill_in 'User name', :with => user.username
  fill_in 'Password', :with => user.password
  click_button 'Sign in'
end