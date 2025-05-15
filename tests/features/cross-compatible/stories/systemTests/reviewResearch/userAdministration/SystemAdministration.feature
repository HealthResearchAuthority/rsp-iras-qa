@SystemAdministration @adminUser @SystemTest
Feature: User Administration: System Administration

  Background:
    Given I have navigated to the 'System_Administration_Page'
    Then I can see the system administration home page

  @rsp-2931 @SystemAdministrationPage
  Scenario Outline: Validate the system administration home page
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

  @rsp-3519 @ValidateTopMenuBarLinks
  Scenario: Validate the top menu bar links
    And the top menu bar will not have links to 'Manage Users' or 'System Admin'