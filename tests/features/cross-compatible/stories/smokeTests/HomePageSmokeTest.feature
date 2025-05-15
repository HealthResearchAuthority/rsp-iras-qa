@adminUser @homePageSmokeFeature @Smoke
Feature: As an Authenticated Admin User I have Access to Authorised Application Features

  Background:
    Given I have navigated to the 'Home_Page'

  @logoutSmoke
  Scenario: I am able to Logout
    When I click the 'Logout' button on the 'Banner'
    And I can see a 'Login' button on the 'Home_Page'

  @accessApplicationSmoke
  Scenario Outline: I am able to Add and Edit Applications
    Then I can see project guidance text on the home_page
    And I can see a '<Link_Type>' link on the 'Banner'

    Examples:
      | Link_Type |
      | My research |
      |System administration|

