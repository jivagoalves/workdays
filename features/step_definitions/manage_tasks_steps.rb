Given /^I am signed in as (.*)$/ do |firstname|
  @user = Factory.build(:user, :firstname => firstname)
  @user.save_without_session_maintenance
  sign_in(@user)
end

Given /^I have a task$/ do
  @task = Factory(:task, :user_id => @user.id)
end

When /^I go to the list of tasks$/ do
  visit tasks_path
end

When /^I report (\d+) minutes spent on the task$/ do |minutes|
  click_link 'Add time'
  fill_in 'How many minutes?', :with => '10'
  click_button 'Add'
end

Then /^I should see "([^"]*)"$/ do |minutes|
  page.should have_content(minutes)
end