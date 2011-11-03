Given /^I am an administrator$/ do
  @user.admin = true
  @user.save!
end

Given /^I am an user$/ do
end

Given /^I have an user called "([^"]*)"$/ do |firstname|
  email = Factory.next(:email)
  username = Factory.next(:username)
  Factory(:user,
          :firstname => firstname,
          :email => email,
          :username => username)
end

When /^I go to the list of users$/ do
  visit users_path
end

Then /^I should (.*) see the user called "([^"]*)"$/ do |not_word, username|
  if not_word == "not"
    page.should have_no_content(username)
  else
    page.should have_content(username)
  end
end

Then /^I should be redirected to homepage$/ do
  current_path.should == root_path
end
