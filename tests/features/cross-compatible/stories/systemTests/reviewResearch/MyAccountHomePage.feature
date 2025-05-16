@HomePage @adminUser @SystemTest
Feature: My Account Home page

  Background:
    Given I have navigated to the 'Home_Page'

  @rsp-3421 @MyAccountHomepage
  Scenario Outline: Validate the My Account Home page
    Given I can see project guidance text on the home_page
    Then I can see the my account home page
    Then I can see the '<Validation_Text>' ui labels on the my account home page
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
