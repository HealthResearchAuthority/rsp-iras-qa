@RegressionCreateManageUsers @RegressionManageUsers @SysAdminUser @Regression
Feature: User Administration: Create Manage Users

    Background:
        Given I have navigated to the 'Home_Page'
        And I click the 'System_Administration' link on the 'Home_Page'
        And I can see the system administration home page
        And I click the 'Manage_Users' link on the 'System_Administration_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
        And I can see the add a new user profile page

    @RegressionTestCreateUserEvents @KNOWN-DEFECT-RSP-3938
    Scenario Outline: Verify the user is able to create new user profiles with various roles, with an audit history log
        When I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        And I capture the page screenshot
        And I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the check and create user profile page
        When I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        Then I can see the create user profile confirmation page for '<Add_User_Profile>'
        And I capture the current time for 'Audit_History_User_Page'
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I search and click on view edit link for unique '<Add_User_Profile>' user with 'Active' status from the manage user page
        Then I can see the user profile page
        And I can see the '<Add_User_Profile>' user has the correct roles assigned on their profile page
        When I click the change link against '<Field_Name>' on the user profile page
        Then I can see that the '<Add_User_Profile>' users data persists on the edit profile page
        And I capture the page screenshot
        And I click the 'Back' link on the 'Edit_User_Profile_Page'
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        Then I can see the audit history page of the selected '<Add_User_Profile>' user
        And I capture the page screenshot
        And I can see the audit history for the newly created '<Add_User_Profile>' user with roles assigned

        Examples:
            | Add_User_Profile                                           | Field_Name |
            | Valid_Data_In_All_Fields_Role_Operations                   | Role       |
            | Valid_Data_In_All_Fields_Role_System_Administrator_Another | Role       |

    @RegressionTestAddAnotherUser
    Scenario Outline: Verify the user is able to continue adding users via the link provided on the Confirmation screen
        When I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        And I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the check and create user profile page
        And I capture the page screenshot
        When I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        Then I can see the create user profile confirmation page for '<Add_User_Profile>'
        And I capture the page screenshot
        When I click the 'Add_another_user' link on the 'Create_User_Profile_Confirmation_Page'
        Then I can see the add a new user profile page
        And I capture the page screenshot
        When I fill the new user profile page using '<Add_Another_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        And I can see previously filled values in the new user profile page for '<Add_Another_User_Profile>' displayed on the check and create user profile page
        And I capture the page screenshot
        When I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        Then I can see the create user profile confirmation page for '<Add_Another_User_Profile>'
        And I capture the page screenshot

        Examples:
            | Add_User_Profile                                   | Add_Another_User_Profile                                   |
            | Valid_Data_In_All_Fields_Role_System_Administrator | Valid_Data_In_All_Fields_Role_System_Administrator_Another |

    @RegressionTestUnassignUserRoles @KNOWN-DEFECT-RSP-3938 @fail
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
        Then I can see the '<Add_User_Profile>' user has had their roles unassigned in the audit history

        Examples:
            | Add_User_Profile     | Field_Name | Edit_User                 |
            | Valid_Data_All_Roles | Role       | User_Roles_Checkbox_Empty |

    @RegressionTestEnableDisableUserProfile
    Scenario Outline: Verify the user is able to disable, then re-enable a user profile, with an audit history log
        When I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        Then I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        When I search and click on view edit link for unique '<Add_User_Profile>' user with 'ACTIVE' status from the manage user page
        Then I can see the user profile page
        And I can see the 'Disable_Label_Texts' ui labels on the user profile page
        And I capture the page screenshot
        When I click the 'Disable_User_Record' button on the 'User_Profile_Page'
        And I validate 'Disable_User_Profile_Labels' labels displayed in disable user profile confirmation page using the '<Add_User_Profile>' details
        And I capture the page screenshot
        And I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time for 'Audit_History_User_Page'
        And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
        Then I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        When I search and click on view edit link for unique '<Add_User_Profile>' user with 'DISABLED' status from the manage user page
        Then I can see the 'Enable_Label_Texts' ui labels on the user profile page
        And I can see that the user profiles last updated field has the current time
        And I capture the page screenshot
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        And I can see the users audit history with the 'Disable_User' event as the most recent entry
        And I capture the page screenshot
        And I click the 'Back' link on the 'Audit_History_User_Page'
        And I click the 'Enable_User_Record' button on the 'User_Profile_Page'
        Then I validate 'Enable_User_Profile_Labels' labels displayed in enable user profile confirmation page using the '<Add_User_Profile>' details
        And I capture the page screenshot
        When I click the 'Confirm' button on the 'Confirmation_Page'
        And I capture the current time for 'Audit_History_User_Page'
        Then I validate 'Enable_User_Profile_Labels' labels displayed in enable user profile success page using the '<Add_User_Profile>' details
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I search and click on view edit link for unique '<Add_User_Profile>' user with 'ACTIVE' status from the manage user page
        Then I can see the 'Disable_Label_Texts' ui labels on the user profile page
        And I capture the page screenshot
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        Then I can see the users audit history with the 'Enable_User' event as the most recent entry
        And I capture the page screenshot

        Examples:
            | Add_User_Profile                         |
            | Valid_Data_In_All_Fields_Role_Operations |

    @RegressionTestCreateUserProfileBackLinks
    Scenario Outline: Verify the user can navigate from 'Check and create user profile' back to system admin page via the 'Back' links
        When I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        And I capture the page screenshot
        When I click the 'Back' link on the 'Check_Create_User_Profile_Page'
        Then I can see the add a new user profile page
        And I capture the page screenshot
        When I click the 'Back' link on the 'Create_User_Profile_Page'
        Then I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        When I click the 'Back' link on the 'Manage_Users_Page'
        Then I can see the 'System_Administration_Page'
        And I capture the page screenshot

        Examples:
            | Add_User_Profile                                   |
            | Valid_Data_In_All_Fields_Role_System_Administrator |

    @RegressionTestCreateUserErrorMessagesInvalidData @KNOWN-DEFECT-Incorrect_Format_Field_Email_Address_Error
    Scenario Outline: Validate relevant error messages are displayed for invalid data entry on the create user profile page
        When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Create_User_Profile_Page'
        And I capture the page screenshot

        Examples:
            | Invalid_Data_User_Profile                                 | Field_And_Summary_Error_Message                                 |
            | Missing_Mandatory_Fields_Role_Not_Operations              | Missing_Mandatory_Fields_Role_Not_Operations_Error              |
            | Missing_Mandatory_Fields_Role_Operations                  | Missing_Mandatory_Fields_Role_Operations_Error                  |
            | Missing_Mandatory_Field_First_Name_Role_Not_Operations    | Missing_Mandatory_Field_First_Name_Role_Not_Operations_Error    |
            | Missing_Mandatory_Field_Last_Name_Role_Not_Operations     | Missing_Mandatory_Field_Last_Name_Role_Not_Operations_Error     |
            | Missing_Mandatory_Field_Email_Address_Role_Not_Operations | Missing_Mandatory_Field_Email_Address_Role_Not_Operations_Error |
            | Missing_Mandatory_Field_Country_Role_Operations           | Missing_Mandatory_Field_Country_Role_Operations_Error           |
            # | Missing_Mandatory_Field_Access_Required_Role_Operations   | Missing_Mandatory_Field_Access_Required_Role_Operations_Error   |
            | Invalid_Character_Limit                                   | Invalid_Character_Limit_Error                                   |
            | Invalid_Email_Data_Max_Char                               | Invalid_Character_Limit_Field_Email_Address_Error               |
            | Incorrect_Format_Telephone_Data                           | Incorrect_Format_Field_Telephone_Error                          |
# | Incorrect_Format_Email                                    | Incorrect_Format_Field_Email_Address_Error                      |