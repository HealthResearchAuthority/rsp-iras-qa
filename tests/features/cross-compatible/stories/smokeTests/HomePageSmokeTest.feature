@adminUser @homePageSmokeFeature @Smoke
Feature: As an Authenticated Admin User I have Access to Authorised Application Features

  Background:
    As an Authenticated Admin User
    Given I have navigated to the 'Home_Page'

  @logoutSmoke
  Scenario: I am able to Logout
    When I click the 'Logout' button
    Then I can see the 'Home_Page'
    And I can see a 'Login' button

  @accessApplicationSmoke
  Scenario Outline: I am able to Add and Edit Applications
    Then I can see a '<Button_Type>' button

    Examples:
      | Button_Type      |
      | New_Application  |
      | Edit_Application |