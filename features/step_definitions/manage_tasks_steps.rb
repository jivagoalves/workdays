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

Given /^I have a task described as "([^"]*)"$/ do |description|
  @task = Factory(:task, :user_id => @user.id, :description => description)
end

When /^I delete the task described as "([^"]*)"$/ do |description|
  click_button 'X'
end

Then /^I should not see the task described as "([^"]*)"$/ do |description|
  page.should have_no_content(description)
end

Given /^I have no task$/ do
end

When /^I create a task described as "([^"]*)"$/ do |description|
  within("form.new_task") do
    fill_in 'task_description', :with => description
    click_button 'Add'
  end
end

Then /^I should see a task described "([^"]*)"$/ do |description|
  page.should have_content(description)
end

When /^I update the task description from "([^"]*)" to "([^"]*)"$/ do |old_description, new_description|
  click_link old_description
  within("form.edit_task") do
    fill_in 'task_description', :with => new_description
    click_button 'Save'
  end
end

Then /^I should see the task described as "([^"]*)"$/ do |description|
  visit tasks_path
  page.should have_content(description)
end