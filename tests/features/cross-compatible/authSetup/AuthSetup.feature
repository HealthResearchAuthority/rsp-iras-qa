@authSetup
Feature: Authenticate Test Users once only, before test run

  Scenario Outline: Login & Authenticate Test Users
    Given I have navigated to the 'Login_Page'    
    When I login to the application as the '<User>'
    Then I can see the 'Home_Page'
    And I will store the '<User>' authentication state
    Examples:
      | User       |
      | Admin_User |    