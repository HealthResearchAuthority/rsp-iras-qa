@authSetup
Feature: Authenticate Test Users once only, before test run

  Scenario: Login & Authenticate POC User
    Given I have navigated to the 'Home_Page'
    And I click the 'SignIn' button
    Then I can see the 'Login_Page'
    # And I will store the '<User>' Authentication State

    # Examples:
    #   | User     | Page       |
    #   | POC_User | Tasks_Page |
