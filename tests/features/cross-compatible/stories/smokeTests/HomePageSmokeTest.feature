@adminUser @homePageSmokeFeature @Smoke
Feature: As an Authenticated Admin User I have Access to Authorised Application Features

  Background:
    Given I have navigated to the 'Home_Page'

  @logoutSmoke
  Scenario: I am able to Logout
    When I click the 'Logout' button on the 'Banner'
    Then I can see the 'Home_Page'
    And I can see a 'Login' button on the 'Home_Page'

  @accessApplicationSmoke
  Scenario Outline: I am able to Add and Edit Applications
    Then I can see a '<Button_Type>' button on the 'Home_Page'
    And I can see a '<Link_Type>' link on the 'Home_Page'
    And I can see a '<Link_Type>' link on the 'Banner'

    Examples:
      | Button_Type              | Link_Type       |
      | Make_Changes_To_Research | My_Applications |
