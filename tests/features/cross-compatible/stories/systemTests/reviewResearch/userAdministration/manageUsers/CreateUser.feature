
@UserAdministration  @ManageUsers @adminUser @SystemTest
Feature: User Administration: Manage Users - Create user

    Background:
        Given I have navigated to the 'System_Administration_Page'
        When I click the 'Manage_Users' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Users_Page'
        When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
        Then I can see the add a new user profile page

    @rsp-2827 @rsp-2870 @verifyUserCreation
    Scenario Outline: Verify the user is able to create a new user profile with valid data
        And I capture the page screenshot
        When I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        And I capture the page screenshot
        Then I can see the '<Validation_Text_Add_New_User_Profile>' ui labels on the check and create user profile page for '<Role_Checkbox>'
        Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the check and create user profile page
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        Then I can see the create user profile confirmation page for '<Add_User_Profile>'
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        Then I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        Then I can see the '<Validation_Text_Manage_Users_List>' ui labels on the manage users list page
        And I can see the newly created user record should be present in the list for '<Add_User_Profile>' with 'ACTIVE' status in the manage user page
        And I capture the page screenshot
        And I click the 'Back' link on the 'Manage_Users_Page'
        Then I have navigated to the 'System_Administration_Page'
        And I capture the page screenshot
        When I click the 'Manage_Users' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Users_Page'
        And I can see the list is sorted by default in the alphabetical order of the 'First Name'

        Examples:
            | Add_User_Profile                                   | Validation_Text_Add_New_User_Profile | Role_Checkbox       | Validation_Text_Manage_Users_List |
            | Valid_Data_In_All_Fields_Role_Reviewer             | Label_Texts_Role_Not_Operations      | Role_Not_Operations | Label_Texts_Manage_Users_List     |
            | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer   | Label_Texts_Role_Not_Operations      | Role_Not_Operations | Label_Texts_Manage_Users_List     |
            | Valid_Data_In_All_Fields_Role_Operations           | Label_Texts_Role_Operations          | Role_Operations     | Label_Texts_Manage_Users_List     |
            | Valid_Data_In_All_Mandatory_Fields_Role_Operations | Label_Texts_Role_Operations          | Role_Operations     | Label_Texts_Manage_Users_List     |

    @rsp-2827 @rsp-2870 @verifyAddAnotherUser
    Scenario Outline: Verify the user is able to add another user from the Confirmation message screen using the link
        When I fill the new user profile page using '<Add_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the check and create user profile page
        And I capture the page screenshot
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        Then I can see the create user profile confirmation page for '<Add_User_Profile>'
        And I capture the page screenshot
        When I click the 'Add_another_user' link on the 'Create_User_Profile_Confirmation_Page'
        Then I can see the add a new user profile page
        And I capture the page screenshot
        When I fill the new user profile page using '<Add_Another_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        Then I can see previously filled values in the new user profile page for '<Add_Another_User_Profile>' displayed on the check and create user profile page
        And I capture the page screenshot
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        Then I can see the create user profile confirmation page for '<Add_Another_User_Profile>'
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        Then I can see the 'Manage_Users_Page'
        And I click the 'Back' link on the 'Manage_Users_Page'
        Then I have navigated to the 'System_Administration_Page'
        When I click the 'Manage_Users' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Users_Page'

        Examples:
            | Add_User_Profile                                   | Add_Another_User_Profile                                   |
            | Valid_Data_In_All_Fields_Role_Operations           | Valid_Data_In_All_Fields_Role_Operations_Another           |
            | Valid_Data_In_All_Fields_Role_Reviewer             | Valid_Data_In_All_Fields_Role_Reviewer_Another             |
            | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer   | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer_Another   |
            | Valid_Data_In_All_Mandatory_Fields_Role_Operations | Valid_Data_In_All_Mandatory_Fields_Role_Operations_Another |

    @rsp-2827 @verifyCreateUserProfileBackLink
    Scenario: Verify the user can navigate from 'Add a new user profile' page by clicking 'Back' link
        When I click the 'Back' link on the 'Create_User_Profile_Page'
        Then I can see the 'Manage_Users_Page'

    @rsp-2827 @verifyCheckCreateUserProfileBackLink
    Scenario Outline: Verify the user can navigate from 'Check and create user profile' page to add a new user profile page by clicking 'Back' link
        When I fill the new user profile page using '<Add_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the check and create user profile page
        When I click the 'Back' link on the 'Check_Create_User_Profile_Page'
        Then I can see the add a new user profile page
        Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the add a new user profile page
        When I fill the new user profile page using '<Add_Another_User_Profile>'
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        Then I can see previously filled values in the new user profile page for '<Add_Another_User_Profile>' displayed on the check and create user profile page
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        Then I can see the create user profile confirmation page for '<Add_Another_User_Profile>'
        When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        Then I can see the 'Manage_Users_Page'
        And I can see the newly created user record should be present in the list for '<Add_Another_User_Profile>' with 'ACTIVE' status in the manage user page

        Examples:
            | Add_User_Profile                                   | Add_Another_User_Profile                                   |
            | Valid_Data_In_All_Fields_Role_Operations           | Valid_Data_In_All_Fields_Role_Operations_Another           |
            | Valid_Data_In_All_Fields_Role_Reviewer             | Valid_Data_In_All_Fields_Role_Reviewer_Another             |
            | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer   | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer_Another   |
            | Valid_Data_In_All_Mandatory_Fields_Role_Operations | Valid_Data_In_All_Mandatory_Fields_Role_Operations_Another |

    @rsp-2827 @verifyCheckCreateUserProfileChangeLinkRoleOperations @RoleCheckbox
    Scenario Outline: Verify the user can navigate from 'Check and create user profile' page by clicking 'Change' button against all the fields when the role is selected as operations
        And I capture the page screenshot
        When I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        And I capture the page screenshot
        Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the check and create user profile page
        When I click the change link against '<Field_Name>' on the check and create user profile page
        Then I can see the add a new user profile page
        Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the add a new user profile page
        And I capture the page screenshot
        And I uncheck the previously selected checkboxes on the add a new user profile page for '<Add_User_Profile>' for the role is selected as operations
        And I clear the previously entered values on the add a new user profile page for '<Add_User_Profile>' for '<Role_Checkbox>'
        And I capture the page screenshot
        When I fill the new user profile page using '<Add_Another_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        Then I can see previously filled values in the new user profile page for '<Add_Another_User_Profile>' displayed on the check and create user profile page
        And I capture the page screenshot

        Examples:
            | Add_User_Profile                                   | Field_Name      | Add_Another_User_Profile                                   | Role_Checkbox   |
            | Valid_Data_In_All_Fields_Role_Operations           | Title           | Valid_Data_In_All_Fields_Role_Operations_Another           | Role_Operations |
            | Valid_Data_In_All_Fields_Role_Operations           | First_Name      | Valid_Data_In_All_Fields_Role_Operations_Another           | Role_Operations |
            | Valid_Data_In_All_Fields_Role_Operations           | Last_Name       | Valid_Data_In_All_Fields_Role_Operations_Another           | Role_Operations |
            | Valid_Data_In_All_Fields_Role_Operations           | Email_Address   | Valid_Data_In_All_Fields_Role_Operations_Another           | Role_Operations |
            | Valid_Data_In_All_Fields_Role_Operations           | Telephone       | Valid_Data_In_All_Fields_Role_Operations_Another           | Role_Operations |
            | Valid_Data_In_All_Fields_Role_Operations           | Organisation    | Valid_Data_In_All_Fields_Role_Operations_Another           | Role_Operations |
            | Valid_Data_In_All_Fields_Role_Operations           | Job_Title       | Valid_Data_In_All_Fields_Role_Operations_Another           | Role_Operations |
            | Valid_Data_In_All_Fields_Role_Operations           | Role            | Valid_Data_In_All_Fields_Role_Operations_Another           | Role_Operations |
            | Valid_Data_In_All_Fields_Role_Operations           | Committee       | Valid_Data_In_All_Fields_Role_Operations_Another           | Role_Operations |
            | Valid_Data_In_All_Fields_Role_Operations           | Country         | Valid_Data_In_All_Fields_Role_Operations_Another           | Role_Operations |
            | Valid_Data_In_All_Mandatory_Fields_Role_Operations | Access_Required | Valid_Data_In_All_Mandatory_Fields_Role_Operations_Another | Role_Operations |
            | Valid_Data_In_All_Mandatory_Fields_Role_Operations | Review_Body     | Valid_Data_In_All_Mandatory_Fields_Role_Operations_Another | Role_Operations |

    @rsp-2827 @verifyCheckCreateUserProfileChangeLinkRoleNotOperations @RoleCheckbox
    Scenario Outline: Verify the user can navigate from 'Check and create user profile' page by clicking 'Change' button against all the fields when the role is selected as reviewer
        And I capture the page screenshot
        When I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        And I capture the page screenshot
        Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the check and create user profile page
        When I click the change link against '<Field_Name>' on the check and create user profile page
        Then I can see the add a new user profile page
        Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the add a new user profile page
        And I capture the page screenshot
        And I clear the previously entered values on the add a new user profile page for '<Add_User_Profile>' for role is not selected as operations
        And I capture the page screenshot
        When I fill the new user profile page using '<Add_Another_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        Then I can see previously filled values in the new user profile page for '<Add_Another_User_Profile>' displayed on the check and create user profile page
        And I capture the page screenshot

        Examples:
            | Add_User_Profile                                 | Field_Name    | Add_Another_User_Profile                                 |
            | Valid_Data_In_All_Fields_Role_Reviewer           | Title         | Valid_Data_In_All_Fields_Role_Reviewer_Another           |
            | Valid_Data_In_All_Fields_Role_Reviewer           | First_Name    | Valid_Data_In_All_Fields_Role_Reviewer_Another           |
            | Valid_Data_In_All_Fields_Role_Reviewer           | Last_Name     | Valid_Data_In_All_Fields_Role_Reviewer_Another           |
            | Valid_Data_In_All_Fields_Role_Reviewer           | Email_Address | Valid_Data_In_All_Fields_Role_Reviewer_Another           |
            | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer | Telephone     | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer_Another |
            | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer | Organisation  | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer_Another |
            | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer | Job_Title     | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer_Another |
            | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer | Role          | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer_Another |

    @rsp-2827 @rsp-2870 @rsp-3107 @rsp-3108 @verifyCreateUserMultiUserRoles
    Scenario Outline: Verify the user is able to create a new user profile with multiple roles
        When I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        And I capture the page screenshot
        And I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the check and create user profile page
        When I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        Then I can see the create user profile confirmation page for '<Add_User_Profile>'
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I search and click on view edit link for unique '<Add_User_Profile>' user with 'ACTIVE' status from the manage user page
        When I can see the user profile page
        Then I can see the '<Add_User_Profile>' user has the correct roles assigned on their profile page
        When I click the change link against '<Field_Name>' on the user profile page
        Then I can see that the '<Add_User_Profile>' users data persists on the edit profile page

        Examples:
            | Add_User_Profile                                   | Field_Name |
            | Valid_Data_In_All_Fields_Role_Operations           | Role       |
            | Valid_Data_In_All_Fields_Role_Reviewer_Another     | Role       |
            | Valid_Data_In_All_Mandatory_Fields_Role_Operations | Role       |
            | Valid_Data_All_Roles                               | Role       |
            | Valid_Data_No_Roles                                | Role       |

    @rsp-2827 @verifyErrorMessagesInvalidData
    # few lines commented>> pending clarification >> email validation
    # telephone :- Telephone must be 11 digits or less
    # telephone incorrect format
    Scenario Outline: Validate error messages are displayed for invalid data in create user profile page
        Validate proper error messages are displayed for missing mandatory fields-First name,Last name,Email address-Country,Access required
        Validate proper error messages are displayed for invalid character limit-Title,First name,Last name,Email address,Telephone,Organisation,Job title
        Validate proper error messages are displayed for incorrect format-Email address,Telephone
        When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I validate '<Field_And_Summary_Error_Message>' displayed on create user profile page
        And I capture the page screenshot

        Examples:
            | Invalid_Data_User_Profile                                 | Field_And_Summary_Error_Message                                         |
            | Missing_Mandatory_Fields_Role_Not_Operations              | Error_Message_Missing_Mandatory_Fields_Role_Not_Operations              |
            | Missing_Mandatory_Fields_Role_Operations                  | Error_Message_Missing_Mandatory_Fields_Role_Operations                  |
            | Missing_Mandatory_Field_First_Name_Role_Not_Operations    | Error_Message_Missing_Mandatory_Field_First_Name_Role_Not_Operations    |
            | Missing_Mandatory_Field_Last_Name_Role_Not_Operations     | Error_Message_Missing_Mandatory_Field_Last_Name_Role_Not_Operations     |
            | Missing_Mandatory_Field_Email_Address_Role_Not_Operations | Error_Message_Missing_Mandatory_Field_Email_Address_Role_Not_Operations |
            | Missing_Mandatory_Field_Country_Role_Operations           | Error_Message_Missing_Mandatory_Field_Country_Role_Operations           |
            | Missing_Mandatory_Field_Access_Required_Role_Operations   | Error_Message_Missing_Mandatory_Field_Access_Required_Role_Operations   |
            | Invalid_Character_Limit                                   | Error_Message_Invalid_Character_Limit                                   |
            | Invalid_Email_Data_Max_Char                               | Error_Message_Invalid_Character_Limit_field_Email_Address               |
            | Incorrect_Format_Telephone_Data                           | Error_Message_Incorrect_Format_field_Telephone                          |
            | Incorrect_Format_Email                                    | Error_Message_Incorrect_Format_field_Email_Address                      |
            # | Invalid_Email_Data_Start_With_Dot                  | Error_Message_Incorrect_Format_field_Email_Address         |
            | Invalid_Email_Data_Double_Dot                             | Error_Message_Incorrect_Format_field_Email_Address                      |
            | Invalid_Email_Data_Space                                  | Error_Message_Incorrect_Format_field_Email_Address                      |
            # | Invalid_Email_Data_Wrong_AT                        | Error_Message_Incorrect_Format_field_Email_Address         |
            | Invalid_Email_Data_Less_Greater_Symbols                   | Error_Message_Incorrect_Format_field_Email_Address                      |
            | Invalid_Email_Data_Colon                                  | Error_Message_Incorrect_Format_field_Email_Address                      |
            | Invalid_Email_Data_Semi_Colon                             | Error_Message_Incorrect_Format_field_Email_Address                      |
            | Invalid_Email_Data_Comma                                  | Error_Message_Incorrect_Format_field_Email_Address                      |
            # | Invalid_Email_Data_Start_With_Hyphen               | Error_Message_Incorrect_Format_field_Email_Address         |
            # | Invalid_Email_Data_Hyphen_Before_Domain            | Error_Message_Incorrect_Format_field_Email_Address         |
            | Invalid_Email_Data_Double_Dot_Domain                      | Error_Message_Incorrect_Format_field_Email_Address                      |
            | Invalid_Email_Data_Exclamation_Domain                     | Error_Message_Incorrect_Format_field_Email_Address                      |
            # | Invalid_Email_Data_Unicode                         | Error_Message_Incorrect_Format_field_Email_Address         |
            # | Invalid_Email_Data_Single_Quote_Before_AT          | Error_Message_Incorrect_Format_field_Email_Address         |
            | Invalid_Email_Data_Domain_Exceed_Max                      | Error_Message_Incorrect_Format_field_Email_Address                      |
            # | Invalid_Email_Data_Local_Part_Max                  | Error_Message_Incorrect_Format_field_Email_Address         |
            | Invalid_Email_Data_Consecutive_Dot_Domain                 | Error_Message_Incorrect_Format_field_Email_Address                      |
            | Invalid_Email_Data_Consecutive_Dot_SubDomain              | Error_Message_Incorrect_Format_field_Email_Address                      |
            | Invalid_Email_Data_Consecutiv_Dot_Domain_SubDomain        | Error_Message_Incorrect_Format_field_Email_Address                      |
            | Invalid_Email_Data_Emoji                                  | Error_Message_Incorrect_Format_field_Email_Address                      |
            | Invalid_Email_Data_TLD                                    | Error_Message_Incorrect_Format_field_Email_Address                      |
            | Invalid_Email_Data_Missing_AT                             | Error_Message_Incorrect_Format_field_Email_Address                      |
            | Invalid_Email_Data_Reserved_Domain                        | Error_Message_Incorrect_Format_field_Email_Address                      |
            | Invalid_Email_Data_Punycode                               | Error_Message_Incorrect_Format_field_Email_Address                      |


    @rsp-2827 @verifyNoErrorMessagesValidData
    # few lines commented >> pending clarification>>email validation
    Scenario Outline: Validate user is able to fill user profile page with valid data
        Validate email address field with different valid data
        When I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the check and create user profile page
        And I capture the page screenshot

        Examples:
            | Add_User_Profile                    |
            | Valid_Email_Underscore              |
            | Valid_Email_Data_Hyphen             |
            | Valid_Email_Data_Plus               |
            | Valid_Email_Data_Exclamation        |
            | Valid_Email_Data_Hash               |
            | Valid_Email_Data_Dollar             |
            | Valid_Email_Data_Percentage         |
            | Valid_Email_Data_Ampersand          |
            | Valid_Email_Data_Single_Quote       |
            | Valid_Email_Data_Star               |
            | Valid_Email_Data_Slash              |
            | Valid_Email_Data_Equal_Symbol       |
            | Valid_Email_Data_Question_Mark      |
            | Valid_Email_Data_Cap_Symbol         |
            | Valid_Email_Data_Right_Single_Quote |
            | Valid_Email_Data_Curly_Brackets     |
            | Valid_Email_Data_Pipe_Symbol        |
            | Valid_Email_Data_Tilde_Symbol       |
            | Valid_Email_Data_Unicode            |
            | Valid_Email_Data_Special_Characters |
            | Valid_Email_Data_Hyphen_Underscore  |
            | Valid_Email_Data_Multiple_Unicode   |
            # | Valid_Email_Data_Multiple_Sub_Domains |
            # | Valid_Email_Data_Other_Language       |
            | Valid_Email_Data_Domain             |
