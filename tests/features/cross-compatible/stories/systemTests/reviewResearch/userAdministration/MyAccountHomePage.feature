@HomePage @SystemTest
Feature: My Account Home page

  @rsp-3421 @MyAccountHomepage @SysAdminUser
  Scenario Outline: Validate the My Account Home page of system administrator user
    Given I have navigated to the 'Home_Page'
    Given I can see project guidance text on the home_page
    Then I can see the my account home page
    Then I can see the '<Validation_Text>' ui labels on the my account home page
    Then I capture the page screenshot
    When I click the '<Navigation_Link_Second>' link on the 'Home_Page'
    Then I can see the system administration home page
    Then I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'System_Administration_Page'
    Then I can see the my account home page

    Examples:
      | Validation_Text               | Navigation_Link_Second | Navigation_Link |
      | Label_Texts_System_Admin_Role | System_Administration  | Back            |

  @rsp-3421 @MyAccountHomepage @FrontStageUser
  Scenario Outline: Validate the My Account Home page of front stage user
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

    Examples:
      | Validation_Text               | Navigation_Link_First | Navigation_Link |
      | Label_Texts_System_Admin_Role | My_research           | Back            |
  # | Label_Texts_Frontstage_User_Role | My_research           | Back            |

  @rsp-3821 @MyAccountHomepage @NoAuth
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

  @rsp-3821 @MyAccountHomepage @NoAuth
  Scenario Outline: Validate the access of system administration page and other user role
    Given I have navigated to the '<Page>' as '<User>'
    Then I capture the page screenshot
    Then I logged out from the system
    Then I capture the page screenshot
    Examples:
      | User           | Page                       |
      | System_Admin   | System_Administration_Page |
      | Non_Admin_User | Access_Denied_Page         |
