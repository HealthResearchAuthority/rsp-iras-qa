@UserAdministration @ManageUsers @SysAdminUser @SystemTest @DisableEnableUser
Feature: User Administration: Manage Users - Enable / Disable users

    Background:
        Given I have navigated to the 'Home_Page'
        When I click the 'System_Administration' link on the 'Home_Page'
        Then I can see the system administration home page
        When I click the 'Manage_Users' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Users_Page'
        When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
        Then I can see the add a new user profile page

    @rsp-2829 @DisableUserProfile
    Scenario Outline: Verify the user is able to disable a user profile
        When I fill the new user profile page using '<Add_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        And I can see the 'Manage_Users_Page'
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters_Users_Active>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        When I search and click on view edit link for unique '<Add_User_Profile>' user with '<Status_Enabled>' status from the manage user page
        Then I can see the '<Disable_Label_Texts>' ui labels on the user profile page
        And I capture the page screenshot
        When I click the 'Disable_User_Record' button on the 'User_Profile_Page'
        Then I validate '<Disable_User_Profile_Labels>' labels displayed in disable user profile confirmation page using the '<Add_User_Profile>' details
        And I capture the page screenshot
        When I click the 'Confirm' button on the 'Confirmation_Page'
        Then I validate '<Disable_User_Profile_Labels>' labels displayed in disable user profile success page using the '<Add_User_Profile>' details
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters_Users_Disabled>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then I can see the newly created user record should be present in the list for '<Add_User_Profile>' with '<Status_Disabled>' status in the manage user page
        And I capture the page screenshot

        Examples:
            | Add_User_Profile                           | Disable_Label_Texts | Disable_User_Profile_Labels | Status_Enabled | Status_Disabled | Advanced_Filters_Users_Active                   | Advanced_Filters_Users_Disabled                   |
            | Valid_Data_In_All_Fields_Role_Team_Manager | Disable_Label_Texts | Disable_User_Profile_Labels | Enabled        | Disabled        | Advanced_Filter_Role_Team_Manager_Status_Active | Advanced_Filter_Role_Team_Manager_Status_Disabled |

    @rsp-2829 @BreadcrumbDisableUser
    Scenario Outline: Validate breadcrumb navigations in disable user profile confirmation page
        When I fill the new user profile page using '<Add_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters_Users>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I search and click on view edit link for unique '<Add_User_Profile>' user with '<Status_Enabled>' status from the manage user page
        And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
        And I capture the page screenshot
        When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
        Then I can see the user profile page
        And I capture the page screenshot

        Examples:
            | Add_User_Profile                           | Navigation_Link | Status_Enabled | Advanced_Filters_Users                          |
            | Valid_Data_In_All_Fields_Role_Team_Manager | Back            | Enabled        | Advanced_Filter_Role_Team_Manager_Status_Active |

    @rsp-2930 @EnableUserProfile
    Scenario Outline: Verify the user is able to enable a disabled a user profile
        When I fill the new user profile page using '<Add_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters_Users_Active>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I search and click on view edit link for unique '<Add_User_Profile>' user with '<Status_Enabled>' status from the manage user page
        And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters_Users_Disabled>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        When I search and click on view edit link for unique '<Add_User_Profile>' user with '<Status_Disabled>' status from the manage user page
        Then I can see the '<Enable_Label_Texts>' ui labels on the user profile page
        And I capture the page screenshot
        When I click the 'Enable_User_Record' button on the 'User_Profile_Page'
        Then I validate '<Enable_User_Profile_Labels>' labels displayed in enable user profile confirmation page using the '<Add_User_Profile>' details
        And I capture the page screenshot
        When I click the 'Confirm' button on the 'Confirmation_Page'
        Then I validate '<Enable_User_Profile_Labels>' labels displayed in enable user profile success page using the '<Add_User_Profile>' details
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters_Users_Active>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then I can see the newly created user record should be present in the list for '<Add_User_Profile>' with '<Status_Enabled>' status in the manage user page
        And I capture the page screenshot

        Examples:
            | Add_User_Profile                           | Enable_Label_Texts | Enable_User_Profile_Labels | Status_Enabled | Status_Disabled | Advanced_Filters_Users_Active                   | Advanced_Filters_Users_Disabled                   |
            | Valid_Data_In_All_Fields_Role_Team_Manager | Enable_Label_Texts | Enable_User_Profile_Labels | Enabled        | Disabled        | Advanced_Filter_Role_Team_Manager_Status_Active | Advanced_Filter_Role_Team_Manager_Status_Disabled |

    @rsp-2930 @BreadcrumbEnableUser
    Scenario Outline: Validate breadcrumb navigations in enable user profile confirmation page
        When I fill the new user profile page using '<Add_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters_Users_Active>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I search and click on view edit link for unique '<Add_User_Profile>' user with '<Status_Enabled>' status from the manage user page
        And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I select advanced filters in the manage users page using '<Advanced_Filters_Users_Disabled>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        When I search and click on view edit link for unique '<Add_User_Profile>' user with '<Status_Disabled>' status from the manage user page
        When I click the 'Enable_User_Record' button on the 'User_Profile_Page'
        And I capture the page screenshot
        When I click the '<Navigation_Link>' link on the 'Confirmation_Page'
        Then I can see the user profile page
        And I capture the page screenshot

        Examples:
            | Add_User_Profile                           | Navigation_Link | Status_Enabled | Status_Disabled | Advanced_Filters_Users_Active                   | Advanced_Filters_Users_Disabled                   |
            | Valid_Data_In_All_Fields_Role_Team_Manager | Back            | Enabled        | Disabled        | Advanced_Filter_Role_Team_Manager_Status_Active | Advanced_Filter_Role_Team_Manager_Status_Disabled |
