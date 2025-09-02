@UserAdministration @ManageUsers @SysAdminUser @SystemTest @CreateUser
Feature: User Administration: Manage Users - Create user

  Background:
    Given I have navigated to the 'Home_Page'
    When I click the 'System_Administration' link on the 'Home_Page'
    Then I can see the system administration home page
    And I capture the page screenshot
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I capture the page screenshot
    Then I can see the 'Manage_Users_Page'
    When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then I can see the add a new user profile page

  @rsp-2827 @rsp-2870 @verifyUserCreation
  Scenario Outline: Verify the user is able to create a new user profile with valid data
    When I fill the new user profile page using '<Add_User_Profile>'
    And I capture the page screenshot
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    And I capture the page screenshot
    Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the check and create user profile page
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    Then I can see the create user profile confirmation page for '<Add_User_Profile>'
    And I capture the page screenshot
    When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    Then I can see the 'Manage_Users_Page'
    And I capture the page screenshot
    Then I can see the '<Validation_Text_Manage_Users_List>' ui labels on the manage users list page
    And I can see the newly created user record should be present in the list for '<Add_User_Profile>' with '<Status_Enabled>' status in the manage user page
    And I capture the page screenshot
    And I click the 'Back' link on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I capture the page screenshot
    Then I can see the 'Manage_Users_Page'
    And I can see the list is sorted by default in the alphabetical order of the 'First Name'
    And I capture the page screenshot

    Examples:
      | Add_User_Profile                                   | Validation_Text_Manage_Users_List | Status_Enabled |
      | Valid_Data_In_All_Fields_Role_Reviewer             | Label_Texts_Manage_Users_List     | Enabled        |
      | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer   | Label_Texts_Manage_Users_List     | Enabled        |
      | Valid_Data_In_All_Fields_Role_Operations           | Label_Texts_Manage_Users_List     | Enabled        |
      | Valid_Data_In_All_Mandatory_Fields_Role_Operations | Label_Texts_Manage_Users_List     | Enabled        |

  @rsp-2827 @rsp-2870 @verifyAddAnotherUser
  Scenario Outline: Verify the user is able to add another user from the Confirmation message screen using the link
    When I fill the new user profile page using '<Add_User_Profile>'
    And I capture the page screenshot
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I capture the page screenshot
    Then I can see the check and create user profile page
    Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the check and create user profile page
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I capture the page screenshot
    Then I can see the create user profile confirmation page for '<Add_User_Profile>'
    When I click the 'Add_another_user' link on the 'Create_User_Profile_Confirmation_Page'
    And I capture the page screenshot
    Then I can see the add a new user profile page
    When I fill the new user profile page using '<Add_Another_User_Profile>'
    And I capture the page screenshot
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I capture the page screenshot
    Then I can see the check and create user profile page
    Then I can see previously filled values in the new user profile page for '<Add_Another_User_Profile>' displayed on the check and create user profile page
    And I capture the page screenshot
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I capture the page screenshot
    Then I can see the create user profile confirmation page for '<Add_Another_User_Profile>'
    When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I capture the page screenshot
    Then I can see the 'Manage_Users_Page'
    And I can see the newly created user record should be present in the list for '<Add_Another_User_Profile>' with '<Status_Enabled>' status in the manage user page
    And I capture the page screenshot
    And I click the 'Back' link on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I capture the page screenshot
    Then I can see the 'Manage_Users_Page'

    Examples:
      | Add_User_Profile                                   | Add_Another_User_Profile                                   | Status_Enabled |
      | Valid_Data_In_All_Fields_Role_Operations           | Valid_Data_In_All_Fields_Role_Operations_Another           | Enabled        |
      | Valid_Data_In_All_Fields_Role_Reviewer             | Valid_Data_In_All_Fields_Role_Reviewer_Another             | Enabled        |
      | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer   | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer_Another   | Enabled        |
      | Valid_Data_In_All_Mandatory_Fields_Role_Operations | Valid_Data_In_All_Mandatory_Fields_Role_Operations_Another | Enabled        |

  @rsp-2827 @verifyCreateUserProfileBackLink
  Scenario: Verify the user can navigate from 'Add a new user profile' page by clicking 'Back' link
    When I click the 'Back' link on the 'Create_User_Profile_Page'
    And I capture the page screenshot
    Then I can see the 'Manage_Users_Page'

  @rsp-2827 @verifyCheckCreateUserProfileBackLink
  Scenario Outline: Verify the user can navigate from 'Check and create user profile' page to add a new user profile page by clicking 'Back' link
    When I fill the new user profile page using '<Add_User_Profile>'
    And I capture the page screenshot
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I capture the page screenshot
    Then I can see the check and create user profile page
    Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the check and create user profile page
    When I click the 'Back' link on the 'Check_Create_User_Profile_Page'
    And I capture the page screenshot
    Then I can see the add a new user profile page
    Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the add a new user profile page
    And I capture the page screenshot
    And I uncheck the previously selected checkboxes on the add a new user profile page for '<Add_User_Profile>' for the role is selected as operations
    And I capture the page screenshot
    And I clear the previously entered values on the add a new user profile page for '<Add_User_Profile>' for '<Role_Checkbox>'
    And I capture the page screenshot
    When I fill the new user profile page using '<Add_Another_User_Profile>'
    And I capture the page screenshot
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I capture the page screenshot
    Then I can see the check and create user profile page
    Then I can see previously filled values in the new user profile page for '<Add_Another_User_Profile>' displayed on the check and create user profile page
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I capture the page screenshot
    Then I can see the create user profile confirmation page for '<Add_Another_User_Profile>'
    When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I capture the page screenshot
    Then I can see the 'Manage_Users_Page'
    And I can see the newly created user record should be present in the list for '<Add_Another_User_Profile>' with '<Status_Enabled>' status in the manage user page
    And I capture the page screenshot

    Examples:
      | Add_User_Profile                                   | Add_Another_User_Profile                                   | Status_Enabled | Role_Checkbox       |
      | Valid_Data_In_All_Fields_Role_Operations           | Valid_Data_In_All_Fields_Role_Operations_Another           | Enabled        | Role_Operations     |
      | Valid_Data_In_All_Fields_Role_Reviewer             | Valid_Data_In_All_Fields_Role_Reviewer_Another             | Enabled        | Role_Not_Operations |
      | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer   | Valid_Data_In_All_Mandatory_Fields_Role_Reviewer_Another   | Enabled        | Role_Not_Operations |
      | Valid_Data_In_All_Mandatory_Fields_Role_Operations | Valid_Data_In_All_Mandatory_Fields_Role_Operations_Another | Enabled        | Role_Operations     |

  @rsp-2827 @rsp-4021 @verifyCheckCreateUserProfileChangeLinkRoleOperations @RoleCheckbox
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
    And I search and click on view edit link for unique '<Add_User_Profile>' user with '<Status_Enabled>' status from the manage user page
    When I can see the user profile page
    Then I can see the '<Add_User_Profile>' user has the correct roles assigned on their profile page
    When I click the change link against '<Field_Name>' on the user profile page
    Then I can see that the '<Add_User_Profile>' users data persists on the edit profile page

    Examples:
      | Add_User_Profile                                   | Field_Name | Status_Enabled |
      | Valid_Data_In_All_Fields_Role_Operations           | Role       | Enabled        |
      | Valid_Data_In_All_Fields_Role_Reviewer_Another     | Role       | Enabled        |
      | Valid_Data_In_All_Mandatory_Fields_Role_Operations | Role       | Enabled        |
      | Valid_Data_All_Roles                               | Role       | Enabled        |
      | Valid_Data_No_Roles                                | Role       | Enabled        |

  @rsp-2827 @VerifyNoErrorMessagesValidData @VerifyNoErrorMessagesValidDataCreateUserPage
  Scenario Outline: Validate user is able to fill the email address field in the create user profile page with valid data
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
      | Valid_Email_Data_Special_Characters |
      | Valid_Email_Data_Hyphen_Underscore  |
      | Valid_Email_Data_Domain             |
  # | Valid_Email_Data_Unicode              |
  # | Valid_Email_Data_Multiple_Unicode     |
  # | Valid_Email_Data_Multiple_Sub_Domains |
  # | Valid_Email_Data_Other_Language     |

  @rsp-3122 @VerifyErrorMessagesInvalidData @VerifyErrorMessagesInvalidDataCreateUserPage @verifyInvalidDataInputs
  Scenario Outline: Validate error messages are displayed for invalid data in create user profile page
    When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
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
      | Missing_Mandatory_Field_Access_Required_Role_Operations   | Missing_Mandatory_Field_Access_Required_Role_Operations_Error   |
      | Invalid_Character_Limit                                   | Invalid_Character_Limit_Error                                   |
      | Invalid_Email_Data_Max_Char                               | Invalid_Character_Limit_Field_Email_Address_Error               |
      | Incorrect_Format_Telephone_Data                           | Incorrect_Format_Field_Telephone_Error                          |
      | Incorrect_Format_Invalid_Character_Limit_Telephone_Data   | Incorrect_Format_Invalid_Character_Limit_Telephone_Error        |
      | Incorrect_Format_Invalid_Character_Limit_Email_Data       | Incorrect_Format_Invalid_Character_Limit_Email_Address_Error    |

  @rsp-3122 @VerifyErrorMessagesInvalidData @VerifyErrorMessagesInvalidDataCreateUserPage @verifyInvalidDataEmails @skip
  Scenario Outline: Validate error messages are displayed for invalid data in the email address field of create user profile page
    When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Create_User_Profile_Page'
    And I capture the page screenshot

    Examples:
      | Invalid_Data_User_Profile                          | Field_And_Summary_Error_Message            |
      | Incorrect_Format_Email                             | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Start_With_Dot                  | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Double_Dot                      | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Space                           | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Wrong_AT                        | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Less_Greater_Symbols            | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Colon                           | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Semi_Colon                      | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Comma                           | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Start_With_Hyphen               | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Hyphen_Before_Domain            | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Double_Dot_Domain               | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Exclamation_Domain              | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Unicode                         | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Single_Quote_Before_AT          | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Domain_Exceed_Max               | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Local_Part_Max                  | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Consecutive_Dot_Domain          | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Consecutive_Dot_SubDomain       | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Consecutiv_Dot_Domain_SubDomain | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Emoji                           | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_TLD                             | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Missing_AT                      | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Reserved_Domain                 | Incorrect_Format_Field_Email_Address_Error |
      | Invalid_Email_Data_Punycode                        | Incorrect_Format_Field_Email_Address_Error |

  @rsp-3122 @VerifyErrorMessagesInvalidData @VerifyErrorInvalidDataCreateUserFromCheckCreateUserProfileBackLink
  Scenario Outline: Validation messages are displayed for invalid data entered after the user has navigated back from 'Check and create user profile' page
    When I fill the new user profile page using '<Add_User_Profile>'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    When I click the 'Back' link on the 'Check_Create_User_Profile_Page'
    Then I can see the add a new user profile page
    Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the add a new user profile page
    And I capture the page screenshot
    And I uncheck the previously selected checkboxes on the add a new user profile page for '<Add_User_Profile>' for the role is selected as operations
    And I clear the previously entered values on the add a new user profile page for '<Add_User_Profile>' for '<Role_Checkbox>'
    And I capture the page screenshot
    When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Create_User_Profile_Page'
    And I capture the page screenshot

    Examples:
      | Add_User_Profile                         | Role_Checkbox   | Invalid_Data_User_Profile                               | Field_And_Summary_Error_Message                               |
      | Valid_Data_In_All_Fields_Role_Operations | Role_Operations | Missing_Mandatory_Fields_Role_Operations                | Missing_Mandatory_Fields_Role_Operations_Error                |
      | Valid_Data_In_All_Fields_Role_Operations | Role_Operations | Missing_Mandatory_Field_Country_Role_Operations         | Missing_Mandatory_Field_Country_Role_Operations_Error         |
      | Valid_Data_In_All_Fields_Role_Operations | Role_Operations | Missing_Mandatory_Field_Access_Required_Role_Operations | Missing_Mandatory_Field_Access_Required_Role_Operations_Error |

  @rsp-3122 @VerifyErrorMessagesInvalidData @VerifyErrorInvalidDataCreateUserFromCheckCreateUserProfileChangeLink
  Scenario Outline: Validate error messages are displayed for invalid data in create user profile page when the user navigated from 'Check and create user profile' page by clicking 'Change' button against the fields
    And I capture the page screenshot
    When I fill the new user profile page using '<Add_User_Profile>'
    And I capture the page screenshot
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    And I capture the page screenshot
    When I click the change link against '<Field_Name>' on the check and create user profile page
    Then I can see the add a new user profile page
    Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the add a new user profile page
    And I capture the page screenshot
    And I uncheck the previously selected checkboxes on the add a new user profile page for '<Add_User_Profile>' for the role is selected as operations
    And I clear the previously entered values on the add a new user profile page for '<Add_User_Profile>' for '<Role_Checkbox>'
    And I capture the page screenshot
    When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Create_User_Profile_Page'
    And I capture the page screenshot

    Examples:
      | Add_User_Profile                         | Field_Name | Role_Checkbox   | Invalid_Data_User_Profile                               | Field_And_Summary_Error_Message                               |
      | Valid_Data_In_All_Fields_Role_Operations | Title      | Role_Operations | Missing_Mandatory_Fields_Role_Operations                | Missing_Mandatory_Fields_Role_Operations_Error                |
      | Valid_Data_In_All_Fields_Role_Operations | First_Name | Role_Operations | Missing_Mandatory_Field_Country_Role_Operations         | Missing_Mandatory_Field_Country_Role_Operations_Error         |
      | Valid_Data_In_All_Fields_Role_Operations | Last_Name  | Role_Operations | Missing_Mandatory_Field_Access_Required_Role_Operations | Missing_Mandatory_Field_Access_Required_Role_Operations_Error |

  @rsp-3952 @DuplicateEmailValidation @DuplicateEmailExisting @VerifyErrorMessagesInvalidData @VerifyErrorMessagesInvalidDataCreateUserPage
  Scenario Outline: Get existing email addresses from manage users list page and validate error messages are displayed for the duplicate email in create user profile page
    When I click the 'Back' link on the 'Create_User_Profile_Page'
    And I capture the page screenshot
    Then I can see the 'Manage_Users_Page'
    When I enter the '<Field_Name>' of the '<Position>' item in the list, into the search field
    And I capture the page screenshot
    And I click the 'Search' button on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then the system displays user records matching the search criteria
    And I capture the page screenshot
    When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then I can see the add a new user profile page
    When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Create_User_Profile_Page'
    And I capture the page screenshot
    Examples:
      | Field_Name    | Position | Invalid_Data_User_Profile           | Field_And_Summary_Error_Message |
      | Email_Address | First    | Duplicate_Email_Role_Not_Operations | Duplicate_Email_Error           |
      | Email_Address | Last     | Duplicate_Email_Role_Operations     | Duplicate_Email_Error           |

  @rsp-3952 @DuplicateEmailValidation @DuplicateEmailNew @VerifyErrorMessagesInvalidData @VerifyErrorMessagesInvalidDataCreateUserPage
  Scenario Outline: Validate error messages are displayed for duplicate email in create user profile page after creating a user
    When I fill the new user profile page using '<Add_User_Profile>'
    And I capture the page screenshot
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    And I capture the page screenshot
    Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the check and create user profile page
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    Then I can see the create user profile confirmation page for '<Add_User_Profile>'
    And I capture the page screenshot
    When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    Then I can see the 'Manage_Users_Page'
    And I capture the page screenshot
    And I can see the newly created user record should be present in the list for '<Add_User_Profile>' with '<Status_Enabled>' status in the manage user page
    And I capture the page screenshot
    When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then I can see the add a new user profile page
    When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Create_User_Profile_Page'
    And I capture the page screenshot
    When I click the 'Back' link on the 'Create_User_Profile_Page'
    And I capture the page screenshot
    Then I can see the 'Manage_Users_Page'
    And I capture the page screenshot
    When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then I can see the add a new user profile page
    And I update the 'newly created user' email to 'lower case'
    When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Create_User_Profile_Page'
    And I capture the page screenshot
    When I click the 'Back' link on the 'Create_User_Profile_Page'
    And I capture the page screenshot
    Then I can see the 'Manage_Users_Page'
    And I capture the page screenshot
    When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then I can see the add a new user profile page
    And I update the 'newly created user' email to 'upper case'
    When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Create_User_Profile_Page'
    And I capture the page screenshot
    When I click the 'Back' link on the 'Create_User_Profile_Page'
    And I capture the page screenshot
    Then I can see the 'Manage_Users_Page'
    And I capture the page screenshot
    And I update the 'newly created user' email to 'remove QAAutomation prefix'
    When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then I can see the add a new user profile page
    When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    And I capture the page screenshot
    Examples:
      | Add_User_Profile                         | Status_Enabled | Invalid_Data_User_Profile       | Field_And_Summary_Error_Message |
      | Valid_Data_In_All_Fields_Role_Operations | Enabled        | Duplicate_Email_Role_Operations | Duplicate_Email_Error           |

  @rsp-3886 @rsp-4026 @verifyLastLoggedInDate
  Scenario Outline: Verify the last login date of user in homepage and manage users page
    And I fill the new user profile page using '<Add_User_Profile>'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the newly created user record should be present in the list for '<Add_User_Profile>' with '<Status_Enabled>' status in the manage user page
    And I validate the last logged in is displayed blank for the new user who has not yet logged in to the application
    And I capture the page screenshot
    Then I logged out from the system
    Then I have navigated to the '<Page>' as '<User_Front_Stage>'
    And I capture the page screenshot
    And I keep note of the current login date
    Then I logged out from the system
    Then I have navigated to the '<Page>' as '<User_System_Admin>'
    And I capture the page screenshot
    And I click the 'System_Administration' link on the 'Home_Page'
    And I click the 'Manage_Users' link on the 'System_Administration_Page'
    When I fill the search input for searching 'users' with '<Search_Query>' as the search query
    And I click the 'Search' button on the 'Manage_Users_Page'
    And I validate the last logged in is displayed as truncated date in manage users page
    And I capture the page screenshot
    Then I have navigated to the '<Page>'
    And I validate the last logged in is displayed as full date in home page
    And I capture the page screenshot
    Examples:
      | Add_User_Profile                       | Status_Enabled | User_Front_Stage | User_System_Admin | Page      | Search_Query           |
      | Valid_Data_In_All_Fields_Role_Reviewer | Enabled        | Applicant_User   | System_Admin      | Home_Page | Front_Stage_User_Email |
