@SystemAdministration @SystemTest
Feature: User Administration: System Administration

  @rsp-2931 @SystemAdministrationPage @adminUser
  Scenario Outline: Validate the system administration home page
    Given I have navigated to the 'Home_Page'
    When I click the 'System_Administration' link on the 'Home_Page'
    Then I can see the system administration home page
    Then I can see the '<Validation_Text>' ui labels on the system administration home page
    Then I capture the page screenshot
    When I click the '<Navigation_Link_First>' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    Then I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Manage_Review_Bodies_Page'
    Then I can see the system administration home page
    Then I capture the page screenshot
    When I click the '<Navigation_Link_Second>' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Users_Page'
    Then I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Manage_Users_Page'
    Then I can see the system administration home page
    Then I capture the page screenshot

    Examples:
      | Validation_Text | Navigation_Link_First | Navigation_Link_Second | Navigation_Link |
      | Label_Texts     | Manage_Review_Bodies  | Manage_Users           | Back            |

  @rsp-3423 @SystemAdministrationPage
  Scenario Outline: Validate return to home page from system administration home page
    Given I have navigated to the 'System_Administration_Page'
    Then I can see the system administration home page
    When I click the 'Back' link on the 'System_Administration_Page'
    Then I can see the my account home page
    Then I capture the page screenshot
    When I have navigated to the 'System_Administration_Page'
    When I click the 'Home' link on the 'Banner'
    Then I can see the my account home page
    Then I capture the page screenshot

  @rsp-3519 @ValidateTopMenuBarLinks @adminUser
  Scenario: Validate the top menu bar links
    Given I have navigated to the 'Home_Page'
    And the top menu bar will not have links to 'Manage Users' or 'System Admin'
    And I capture the page screenshot

  @rsp-3821 @SystemAdministrationPage
  Scenario Outline: Validate the system administration home page
    Given I have navigated to the '<Page>' as '<User>'
    Then I capture the page screenshot
    Then I logged out from the system
    Then I capture the page screenshot
    Examples:
      | User           | Page                       |
      | Admin_User     | Home_Page                  |
      | Non_Admin_User | Access_Denied_Page         |
      | Admin_User     | System_Administration_Page |
      | Non_Admin_User | Home_Page                  |