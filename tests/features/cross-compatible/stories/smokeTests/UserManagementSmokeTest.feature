@SysAdminUser  @UserManagementSmokeFeature @Smoke @skip
Feature: User Administration: Manage Users -Smoke Tests
    # Mange Users - Page title is different
    Background:
        Given I have navigated to the 'Home_Page'
        And I click the 'System_Administration' link on the 'Home_Page'
        And I can see the system administration home page
        And I click the 'Manage_Users' link on the 'System_Administration_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
        And I can see the add a new user profile page

    @UserManagementSmoke
    Scenario Outline: Verify the user can unassign roles from the user profile event, with an audit history log
        When I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        And I capture the page screenshot
        When I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        Then I can see the create user profile confirmation page for '<Add_User_Profile>'
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        Then I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        When I enter '<Search_Queries>' into the search field for manage users page
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I select advanced filters in the manage users page using '<Advanced_Filters>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        When I search and click on view edit link for unique '<Add_User_Profile>' user with 'ACTIVE' status from the manage user page
        Then I can see the user profile page
        And I capture the page screenshot
        When I click the change link against '<Field_Name>' on the user profile page
        Then I can see the edit user profile page
        And I capture the page screenshot
        When I edit the users '<Field_Name>' field with '<Edit_User>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I capture the current time for 'Audit_History_User_Page'
        And I capture the page screenshot
        Then I can see that the user profiles last updated field has the current time
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        And I can see the audit history page of the selected '<Add_User_Profile>' user
        And I capture the page screenshot

        Examples:
            | Add_User_Profile     | Field_Name | Edit_User                 | Advanced_Filters                        | Search_Queries |
            | Valid_Data_All_Roles | Role       | User_Roles_Checkbox_Empty | Advanced_Filter_All_Roles_Status_Active | Role_All       |