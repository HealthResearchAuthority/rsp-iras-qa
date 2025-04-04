@UserAdministration @ManageUsers @adminUser @SystemTest
Feature: User Administration: Manage Users

  Background:
    Given I have navigated to the 'System_Administration_Home_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Home_Page'
    Then I can see the manage users list page
    When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    Then I can see the add a new user profile page

  @rsp-2829 @DisableUserProfile
  Scenario Outline: Verify the user is able to disable a user profile
    When I fill the new user profile page using '<Add_User_Profile>'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the manage users list page
    When I search and click on view edit link for '<Add_User_Profile>' user with 'ACTIVE' status from the manage user page
    Then I can see the '<Disable_Label_Texts>' ui labels on the manage users list page
    And I capture the page screenshot
    When I click the 'Disable_User_Record' button on the 'User_Profile_Page'
    Then I validate '<Disable_User_Profile_Labels>' labels displayed in disable user profile confirmation page using the '<Add_User_Profile>' details
    And I capture the page screenshot
    When I click the 'Confirm' button on the 'Confirmation_Page'
    Then I validate '<Disable_User_Profile_Labels>' labels displayed in disable user profile success page using the '<Add_User_Profile>' details
    And I capture the page screenshot
    When I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
    And I can see the manage users list page
    Then I can see the newly created user record should be present in the list for '<Add_User_Profile>' with 'DISABLED' status in the manage user page
    And I capture the page screenshot

    Examples:
      | Add_User_Profile                         | Disable_Label_Texts | Disable_User_Profile_Labels |
      | Valid_Data_In_All_Fields_Role_Operations | Disable_Label_Texts | Disable_User_Profile_Labels |

  @rsp-2829 @BreadcrumbDisableUser
  Scenario Outline: Validate breadcrumb navigations in disable user profile confirmation page
    When I fill the new user profile page using '<Add_User_Profile>'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the manage users list page
    And I search and click on view edit link for '<Add_User_Profile>' user with 'ACTIVE' status from the manage user page
    And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
    And I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
    Then I can see the user profile page
    And I capture the page screenshot

    Examples:
      | Add_User_Profile                         | Navigation_Link |
      | Valid_Data_In_All_Fields_Role_Operations | Back            |

  @rsp-2930 @EnableUserProfile
  Scenario Outline: Verify the user is able to enable a disabled a user profile
    When I fill the new user profile page using '<Add_User_Profile>'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the manage users list page
    And I search and click on view edit link for '<Add_User_Profile>' user with 'ACTIVE' status from the manage user page
    And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
    And I can see the manage users list page
    When I search and click on view edit link for '<Add_User_Profile>' user with 'DISABLED' status from the manage user page
    Then I can see the '<Enable_Label_Texts>' ui labels on the manage users list page
    And I capture the page screenshot
    When I click the 'Enable_User_Record' button on the 'User_Profile_Page'
    Then I validate '<Enable_User_Profile_Labels>' labels displayed in enable user profile confirmation page using the '<Add_User_Profile>' details
    And I capture the page screenshot
    When I click the 'Confirm' button on the 'Confirmation_Page'
    Then I validate '<Enable_User_Profile_Labels>' labels displayed in enable user profile success page using the '<Add_User_Profile>' details
    And I capture the page screenshot
    When I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
    And I can see the manage users list page
    Then I can see the newly created user record should be present in the list for '<Add_User_Profile>' with 'ACTIVE' status in the manage user page
    And I capture the page screenshot

    Examples:
      | Add_User_Profile                         | Enable_Label_Texts | Enable_User_Profile_Labels |
      | Valid_Data_In_All_Fields_Role_Operations | Enable_Label_Texts | Enable_User_Profile_Labels |

  @rsp-2930 @BreadcrumbEnableUser
  Scenario Outline: Validate breadcrumb navigations in enable user profile confirmation page
    When I fill the new user profile page using '<Add_User_Profile>'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the manage users list page
    And I search and click on view edit link for '<Add_User_Profile>' user with 'ACTIVE' status from the manage user page
    And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
    And I can see the manage users list page
    When I search and click on view edit link for '<Add_User_Profile>' user with 'DISABLED' status from the manage user page
    When I click the 'Enable_User_Record' button on the 'User_Profile_Page'
    And I capture the page screenshot
    When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
    Then I can see the user profile page
    And I capture the page screenshot

    Examples:
      | Add_User_Profile                         | Navigation_Link |
      | Valid_Data_In_All_Fields_Role_Operations | Back            |
