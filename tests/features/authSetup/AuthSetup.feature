@authSetup
Feature: Authenticate Test Users once only, before test run

  Background:
    Given I am on the 'Login' page
      | Page         |
      | IDG_SSO_Page |

  Scenario Outline: Login & Authenticate POC User
    When I login to the application using '<Login>' dataset
    Then I can see the tasks page using '<TaskPage>' dataset
    And I will store the users authentication state using '<Login>' dataset

    Examples:
      | Login    | TaskPage   |
      | POC_User | Tasks_Page |
