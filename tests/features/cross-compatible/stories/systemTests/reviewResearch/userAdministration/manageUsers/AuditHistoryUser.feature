@UserAdministration @ManageUsers @adminUser @SystemTest @AuditHistoryUser @rsp-2928
Feature: User Administration: Manage Users - View audit history for users

    Background:
        Given I have navigated to the 'System_Administration_Page'
        When I click the 'Manage_Users' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Users_Page'

    @VerifyAuditHistoryUserBackLinkNavigation
    Scenario: Verify the user can navigate from audit History page of the user by clicking 'Back' link
        And I select a 'QA Automation' User to View and Edit which is '<Status_Enabled>'
        And I can see the user profile page
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        Then I can see the audit history page of the user profile
        And I capture the page screenshot
        And I click the 'Back' link on the 'Audit_History_User_Page'
        And I capture the page screenshot
        And I can see the user profile page
        Examples:
            | Status_Enabled |
            | Enabled        |

    @VerifyAuditHistoryCreateUserAssignRoles
    Scenario Outline: Verify the user can view the audit history with roles assigned after creating a new user
        And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
        And I can see the add a new user profile page
        And I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        And I can see the check and create user profile page
        And I capture the page screenshot
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        And I can see the create user profile confirmation page for '<Add_User_Profile>'
        And I capture the current time for 'Audit_History_User_Page'
        And I capture the page screenshot
        And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I search and click on view edit link for unique '<Add_User_Profile>' user with '<Status_Enabled>' status from the manage user page
        And I can see the user profile page
        And I capture the page screenshot
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        Then I can see the audit history page of the selected '<Add_User_Profile>' user
        And I capture the page screenshot
        And I can see the audit history for the newly created '<Add_User_Profile>' user with roles assigned

        Examples:
            | Add_User_Profile                                   | Status_Enabled |
            | Valid_Data_In_All_Fields_Role_Operations           | Enabled        |
            | Valid_Data_In_All_Fields_Role_Reviewer_Another     | Enabled        |
            | Valid_Data_In_All_Mandatory_Fields_Role_Operations | Enabled        |

    @VerifyAuditHistoryUserUnassignRole
    Scenario Outline: Verify the user can view the unassign role event in the audit history
        And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
        And I can see the add a new user profile page
        And I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        And I can see the check and create user profile page
        And I capture the page screenshot
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        And I can see the create user profile confirmation page for '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I search and click on view edit link for unique '<Add_User_Profile>' user with '<Status_Enabled>' status from the manage user page
        And I can see the user profile page
        And I capture the page screenshot
        And I click the change link against '<Field_Name>' on the user profile page
        And I can see the edit user profile page
        And I capture the page screenshot
        And I edit the users '<Field_Name>' field with '<Edit_User>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I capture the current time for 'Audit_History_User_Page'
        And I capture the page screenshot
        And I can see that the user profiles last updated field has the current time
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        And I can see the audit history page of the selected '<Add_User_Profile>' user
        And I capture the page screenshot
        Then I can see the '<Add_User_Profile>' user has had their roles unassigned in the audit history

        Examples:
            | Add_User_Profile                               | Field_Name | Edit_User                 | Status_Enabled |
            | Valid_Data_In_All_Fields_Role_Operations       | Role       | User_Roles_Checkbox_Empty | Enabled        |
            | Valid_Data_In_All_Fields_Role_Reviewer_Another | Role       | User_Roles_Checkbox_Empty | Enabled        |
            | Valid_Data_All_Roles                           | Role       | User_Roles_Checkbox_Empty | Enabled        |

    @VerifyAuditHistoryEnableDisableUser
    Scenario Outline: Verify the user can view the audit history after changing the status of a user
        And I select a 'QA Automation' User to View and Edit which is '<Status>'
        And I can see the user profile page
        And I capture the page screenshot
        And I click the '<Change_Status>' button on the 'User_Profile_Page'
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time for 'Audit_History_User_Page'
        And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
        And I have navigated to the 'User_Profile_Page'
        And I capture the page screenshot
        And I can see that the user profiles last updated field has the current time
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        And I can see the audit history page of the user profile
        And I capture the page screenshot
        And I can see the users audit history with the '<Audit_History>' event as the most recent entry

        Examples:
            | Status   | Change_Status       | Audit_History |
            | Enabled  | Disable_User_Record | Disable_User  |
            | Disabled | Enable_User_Record  | Enable_User   |

    @VerifyAuditHistoryEditCommonUserFields
    Scenario Outline: Verify the user can view the audit history after editing common user profile fields
        And I select a 'QA Automation' User to View and Edit which is '<Status_Enabled>'
        And I can see the user profile page
        And I capture the page screenshot
        And I click the change link against '<Field_Name>' on the user profile page
        And I can see the edit user profile page
        And I capture the page screenshot
        And I edit the users '<Field_Name>' field with '<Edit_User>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I capture the current time for 'Audit_History_User_Page'
        And I capture the page screenshot
        And I can see that the user profiles last updated field has the current time
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        And I can see the audit history page of the user profile
        And I capture the page screenshot
        Then I can see the users audit history with the '<Audit_History>' event as the most recent entry
        When I click the 'Back' link on the 'Audit_History_User_Page'
        And I click the change link against '<Field_Name>' on the user profile page
        And I can see the edit user profile page
        And I capture the page screenshot
        And I revert the '<Field_Name>' update of the user profile
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I capture the current time for 'Audit_History_User_Page'
        And I capture the page screenshot
        And I can see that the user profiles last updated field has the current time
        And I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        And I can see the audit history page of the user profile
        And I capture the page screenshot
        Then I can see the users audit history with the '<Audit_History>' event as the most recent entry

        Examples:
            | Field_Name    | Edit_User                   | Audit_History          | Status_Enabled |
            | Title         | User_Title_Update           | Edit_User_Title        | Enabled        |
            | First_Name    | User_First_Name_Text_One    | Edit_User_First_Name   | Enabled        |
            | Last_Name     | User_Last_Name_Text_One     | Edit_User_Last_Name    | Enabled        |
            | Email_Address | User_Email_Address_Text_One | Edit_User_Email        | Enabled        |
            | Telephone     | User_Telephone_Text_One     | Edit_User_Telephone    | Enabled        |
            | Organisation  | User_Organisation_Text_One  | Edit_User_Organisation | Enabled        |
            | Job_Title     | User_Job_Title_Text_One     | Edit_User_Job_Title    | Enabled        |

    @VerifyAuditHistoryEditOperationUserFields
    Scenario Outline: Verify the user can view the audit history after editing fields for an operations user
        And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
        And I can see the add a new user profile page
        And I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        And I can see the check and create user profile page
        And I capture the page screenshot
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        And I can see the create user profile confirmation page for '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I search and click on view edit link for unique '<Add_User_Profile>' user with '<Status_Enabled>' status from the manage user page
        And I can see the user profile page
        And I capture the page screenshot
        And I click the change link against '<Field_Name>' on the user profile page
        And I can see the edit user profile page
        And I capture the page screenshot
        And I edit the users '<Field_Name>' field with '<Edit_User>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I capture the current time for 'Audit_History_User_Page'
        And I capture the page screenshot
        And I can see that the user profiles last updated field has the current time
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        Then I can see the audit history page of the selected '<Add_User_Profile>' user
        And I capture the page screenshot
        And I can see the users audit history with the '<Audit_History>' event as the most recent entry

        Examples:
            | Add_User_Profile                                   | Field_Name | Edit_User                 | Audit_History     | Status_Enabled |
            | Valid_Data_In_All_Fields_Role_Operations           | Country    | User_Country_Checkbox_One | Edit_User_Country | Enabled        |
            | Valid_Data_In_All_Mandatory_Fields_Role_Operations | Country    | User_Country_Checkbox_Two | Edit_User_Country | Enabled        |

    @VerifyAuditHistoryUserDefaultSort
    Scenario Outline: Verify the users audit history should be sorted with the most recent entry first
        And I select a 'QA Automation' User to View and Edit which is '<Status_Enabled>'
        And I can see the user profile page
        And I capture the page screenshot
        And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
        And I have navigated to the 'User_Profile_Page'
        And I capture the page screenshot
        And I click the 'Enable_User_Record' button on the 'User_Profile_Page'
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
        And I have navigated to the 'User_Profile_Page'
        And I click the change link against '<Field_Name>' on the user profile page
        And I can see the edit user profile page
        And I capture the page screenshot
        And I edit the users '<Field_Name>' field with '<Edit_User>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I click the change link against '<Field_Name>' on the user profile page
        And I can see the edit user profile page
        And I capture the page screenshot
        And I revert the '<Field_Name>' update of the user profile
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I capture the page screenshot
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        Then I can see the audit history page of the user profile
        And I capture the page screenshot
        And I can see the default sort should be the most recent entry first based on date and time

        Examples:
            | Field_Name | Edit_User               | Status_Enabled |
            | Telephone  | User_Telephone_Text_One | Enabled        |