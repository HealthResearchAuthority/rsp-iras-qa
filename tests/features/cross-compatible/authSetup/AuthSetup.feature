@authSetup
Feature: Authenticate Test Users once only, before test run

  Background:
    Given I have navigated to the 'Login_Page'

  Scenario Outline: Login & Authenticate POC User
    When I login to the application as the '<User>'
    Then I can see the '<Page>'
    And I will store the '<User>' Authentication State

    Examples:
      | User     | Page       |
      | POC_User | Tasks_Page |
