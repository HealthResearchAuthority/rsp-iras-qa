@HomePage @SystemTest
Feature: My Account Home page

  # Background:
  #   Given I have navigated to the 'Home_Page'
  #   And I can see the my account home page

  @rsp-3421 @MyAccountHomepage @SysAdminUser
  Scenario Outline: Validate the My Account Home page
    Given I have navigated to the 'Home_Page'
    Given I can see project guidance text on the home_page
    Then I can see the my account home page
    Then I can see the '<Validation_Text>' ui labels on the my account home page
    Then I capture the page screenshot
    When I click the '<Navigation_Link_First>' link on the 'Home_Page'
    Then I can see the 'My_Research_Page'
    Then I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'My_Research_Page'
    Then I can see the my account home page
    Then I capture the page screenshot
    When I click the '<Navigation_Link_Second>' link on the 'Home_Page'
    Then I can see the system administration home page
    Then I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'System_Administration_Page'
    Then I can see the my account home page

    Examples:
      | Validation_Text | Navigation_Link_First | Navigation_Link_Second | Navigation_Link |
      | Label_Texts     | My_research           | System_administration  | Back            |

  @rsp-3821 @MyAccountHomepage @TestHomePage @NoAuth
  Scenario Outline: Validate the workspaces in my account home page for different user roles
    Given I have navigated to the 'Home_Page' as '<User>'
    Then I capture the page screenshot
    Then I can see the workspaces in my account home page for '<User>'
    Then I can see the '<Validation_Text>' ui labels on the my account home page
    Then I capture the page screenshot
    Then I logged out from the system
    Then I capture the page screenshot
    Examples:
      | User           | Validation_Text                 |
      | System_Admin   | Label_Texts_System_Admin_Role   |
      # | Frontstage_User | Label_Texts_Frontstage_User_Role |
      | Backstage_User | Label_Texts_Backstage_User_Role |
      | Non_Admin_User | Label_Texts_Backstage_User_Role |

