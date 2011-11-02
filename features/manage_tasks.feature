Feature: Manage Tasks
  In order to do my tasks on time successfully
  As an user
  I want to create and delete tasks, and also report time on them
  
  Background:
    Given I am signed in as Mara
  
  Scenario: User creates a task
    Given I have no task
    When I go to the list of tasks
    And I create a task described as "Have fun on saturday"
    Then I should see a task described "Have fun on saturday"
  
  Scenario: User deletes a task
    Given I have a task described as "Buy food"
    When I go to the list of tasks
    And I delete the task described as "Buy food"
    Then I should not see the task described as "Buy food"
  
  Scenario: User updates an existing task
    Given I have a task described as "Clean the house"
    When I go to the list of tasks
    And I update the task description from "Clean the house" to "Clean the room"
    Then I should not see the task described as "Clean the house"
    And I should see the task described as "Clean the room"
  
  Scenario: User reports spent time on a task
    Given I have a task
    When I go to the list of tasks
    And I report 10 minutes spent on the task
    Then I should see "10 min"
