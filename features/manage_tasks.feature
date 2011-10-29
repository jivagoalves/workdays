Feature: Manage Tasks
  In order to do my tasks on time successfully
  As an user
  I want to create and delete tasks, and also report time on them
  
  Background:
    Given I am signed in as Mara
  
  Scenario: Report Spent Time on a Task
    Given I have a task
    When I go to the list of tasks
    And I report 10 minutes spent on the task
    Then I should see "10 min"
