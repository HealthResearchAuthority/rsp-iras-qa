@RegressionEditManageUsers @RegressionManageUsers @SysAdminUser @Regression @Smoke
Feature: User Administration: Edit Manage Users

    Background:
        Given I have navigated to the 'Home_Page'
        And I click the 'System_Administration' link on the 'Home_Page'
        And I can see the system administration home page
        And I click the 'Manage_Users' link on the 'System_Administration_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot

    @RegressionTestEditCommonUserFields
    Scenario Outline: Verify the user can edit each of the common user profile fields, with an audit history log
        And I select a 'QA Automation' User to View and Edit which is 'active'
        And I can see the user profile page
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
        Then I can see the audit history page of the user profile
        And I capture the page screenshot
        And I can see the users audit history with the '<Audit_History>' event as the most recent entry
        When I click the 'Back' link on the 'Audit_History_User_Page'
        And I click the change link against '<Field_Name>' on the user profile page
        Then I can see the edit user profile page
        And I capture the page screenshot
        When I revert the '<Field_Name>' update of the user profile
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I capture the current time for 'Audit_History_User_Page'
        And I capture the page screenshot
        Then I can see that the user profiles last updated field has the current time
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        Then I can see the audit history page of the user profile
        And I capture the page screenshot
        And I can see the users audit history with the '<Audit_History>' event as the most recent entry

        Examples:
            | Field_Name    | Edit_User                   | Audit_History          |
            | Title         | User_Title_Update           | Edit_User_Title        |
            | First_Name    | User_First_Name_Text_One    | Edit_User_First_Name   |
            | Last_Name     | User_Last_Name_Text_One     | Edit_User_Last_Name    |
            | Email_Address | User_Email_Address_Text_One | Edit_User_Email        |
            | Telephone     | User_Telephone_Text_One     | Edit_User_Telephone    |
            | Organisation  | User_Organisation_Text_One  | Edit_User_Organisation |
            | Job_Title     | User_Job_Title_Text_One     | Edit_User_Job_Title    |

    @RegressionTestEditOperationUserFields
    Scenario Outline: Verify the user can edit the fields applicable to an operations user, with an audit history log
        And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
        And I can see the add a new user profile page
        And I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Operations'
        And I capture the page screenshot
        When I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        And I capture the page screenshot
        When I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        Then I can see the create user profile confirmation page for 'Valid_Data_In_All_Fields_Role_Operations'
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        Then I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        When I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Operations' user with 'ACTIVE' status from the manage user page
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
        Then I can see the audit history page of the selected 'Valid_Data_In_All_Fields_Role_Operations' user
        And I capture the page screenshot
        And I can see the users audit history with the '<Audit_History>' event as the most recent entry

        Examples:
            | Field_Name | Edit_User                 | Audit_History     |
            | Country    | User_Country_Checkbox_One | Edit_User_Country |

    @RegressionTestEditUserProfileBackLinks
    Scenario: Verify the user can navigate from audit and edit user pages of the user back to system admin page via the 'Back' links
        And I select a 'QA Automation' User to View and Edit which is 'active'
        And I can see the user profile page
        And I capture the page screenshot
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        Then I can see the audit history page of the user profile
        And I capture the page screenshot
        When I click the 'Back' link on the 'Audit_History_User_Page'
        Then I can see the user profile page
        And I capture the page screenshot
        When I click the change link against 'Title' on the user profile page
        Then I can see the edit user profile page
        And I capture the page screenshot
        When I click the 'Back' link on the 'Edit_User_Profile_Page'
        Then I can see the user profile page
        And I capture the page screenshot
        When I click the 'Back' link on the 'User_Profile_Page'
        Then I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        When I click the 'Back' link on the 'Manage_Users_Page'
        Then I can see the 'System_Administration_Page'
        And I capture the page screenshot

    @RegressionTestEditUserErrorMessagesInvalidData @KNOWN-DEFECT-Incorrect_Format_Field_Email_Address_Error @only
    Scenario Outline: Validate relevant error messages are displayed for invalid data entry on the edit user profile page
        And I search and click on view edit link for existing 'Valid_Data_Role_Operations' user with '<Status>' status from the manage user page
        And I can see the user profile page
        And I capture the page screenshot
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And I capture the page screenshot
        When I uncheck the previously selected checkboxes on the edit user profile page for '<Edit_User_Profile>' when the role is selected as operations
        And I update user profile with '<Invalid_Data_Edit_User>'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Edit_User_Profile_Page'
        And I capture the page screenshot
        Examples:
            | Edit_User_Profile   | Edit_User_Field          | User_Role  | Status | Invalid_Data_Edit_User                                    | Field_And_Summary_Error_Message                                 |
            | All_Checkbox_Fields | title_text               | Operations | ACTIVE | Missing_Mandatory_Fields_Role_Not_Operations              | Missing_Mandatory_Fields_Role_Not_Operations_Error              |
            | All_Checkbox_Fields | first_name_text          | Operations | ACTIVE | Missing_Mandatory_Fields_Role_Operations                  | Missing_Mandatory_Fields_Role_Operations_Error                  |
            | All_Checkbox_Fields | last_name_text           | Operations | ACTIVE | Missing_Mandatory_Field_First_Name_Role_Not_Operations    | Missing_Mandatory_Field_First_Name_Role_Not_Operations_Error    |
            | All_Checkbox_Fields | telephone_text           | Operations | ACTIVE | Missing_Mandatory_Field_Last_Name_Role_Not_Operations     | Missing_Mandatory_Field_Last_Name_Role_Not_Operations_Error     |
            | All_Checkbox_Fields | organisation_text        | Operations | ACTIVE | Missing_Mandatory_Field_Email_Address_Role_Not_Operations | Missing_Mandatory_Field_Email_Address_Role_Not_Operations_Error |
            | All_Checkbox_Fields | country_checkbox         | Operations | ACTIVE | Missing_Mandatory_Field_Country_Role_Operations           | Missing_Mandatory_Field_Country_Role_Operations_Error           |
            | All_Checkbox_Fields | access_required_checkbox | Operations | ACTIVE | Missing_Mandatory_Field_Access_Required_Role_Operations   | Missing_Mandatory_Field_Access_Required_Role_Operations_Error   |
            | All_Checkbox_Fields | job_title_text           | Operations | ACTIVE | Invalid_Character_Limit                                   | Invalid_Character_Limit_Error                                   |
            | All_Checkbox_Fields | email_address_text       | Operations | ACTIVE | Invalid_Email_Data_Max_Char                               | Invalid_Character_Limit_Field_Email_Address_Error               |
            | All_Checkbox_Fields | telephone_text           | Operations | ACTIVE | Incorrect_Format_Telephone_Data                           | Incorrect_Format_Field_Telephone_Error                          |
            # | All_Checkbox_Fields | email_address_text       | Operations | ACTIVE | Incorrect_Format_Email                                    | Incorrect_Format_Field_Email_Address_Error                      |
# Test with JS on