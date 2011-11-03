Feature: Manage Users
  In order to know who is using my website
  As an administrator
  I want to see all users
  
  Scenario Outline: list users
    Given I am signed in as "<signed user name>"
    And I am an <role>
    And I have an user called "<user name>"
    When I go to the list of users
    Then I should <not> see the user called "<user name>"
  
    Scenarios: only administrator lists users
      | signed user name | role          | user name | not | user name |
      | Jivago           | administrator | Mara      |     | Mara      |
      | Mara             | user          | Jivago    | not | Jivago    |
  
  Scenario: redirect to homepage if a regular user tries to list users
    Given I am signed in as Mara
    And I am an user
    When I go to the list of users
    Then I should be redirected to homepage
