@UserAdministration  @EditViewUsers @adminUser @rsp-2830 @rsp-2828
Feature: User Administration: Manage user profiles, view and edit user profile
    As a user
    I want the ability to edit and view a user profile record
    So that I can access all the user information and keep user information up to date

    Background:
        Given I have navigated to the 'Home_Page'
        When I click the 'Manage_Users' link on the 'Home_Page'
        Then I can see the manage users list page

    @viewUserProfileRoleOperations
    Scenario Outline: View User profile details for the user with role as Operations
        And I search and click on view edit link for existing '<View_User_Profile>' user with '<Status>' status from the manage user page
        Then I can see the view user profile details page
        And I click the 'Back' link on the 'User_Profile_Page'
        Then I can see the manage users list page
        And I click the 'Back' link on the 'Manage_Users_Page'
        Then I have navigated to the 'Home_Page'

        Examples:
            | View_User_Profile             | Status   |
            | Active_User_Role_Operations   | ACTIVE   |
            | Disabled_User_Role_Operations | DISABLED |

    @viewUserProfileRoleReviewer
    Scenario Outline: View User profile details for the user with role as reviewer
        And I search and click on view edit link for existing '<View_User_Profile>' user with '<Status>' status from the manage user page
        Then I can see the view user profile details page
        And I click the 'Back' link on the 'User_Profile_Page'
        Then I can see the manage users list page
        And I click the 'Back' link on the 'Manage_Users_Page'
        Then I have navigated to the 'Home_Page'

        Examples:
            | View_User_Profile           | Status   |
            | Active_User_Role_Reviewer   | ACTIVE   |
            | Disabled_User_Role_Reviewer | DISABLED |

    @editUserProfileOperations
    Scenario Outline: Successful user profile update for user role as Operations
        And I search and click on view edit link for existing 'Valid_Data_Role_Operations' user with '<Status>' status from the manage user page
        Then I can see the view user profile details page
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And I update user profile '<Edit_User_Field_Data>' on 'Edit_User_Profile_Page'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the view user profile details page
        Then I can see the user profile '<Edit_User_Field>' is updated with the edited data '<Edit_User_Field_Data>'
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        And I update user profile '<Original_Data>' on 'Edit_User_Profile_Page'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the view user profile details page
        When I click the 'Back' link on the 'User_Profile_Page'
        Then I can see the manage users list page
        Examples:
            | Edit_User_Field    | User_Role  | Status | Edit_User_Field_Data        | Original_Data                   |
            | title_text         | Operations | ACTIVE | User_Title_Text_One         | Original_Title_Text_One         |
            | first_name_text    | Operations | ACTIVE | User_First_Name_Text_One    | Original_First_Name_Text_One    |
            | last_name_text     | Operations | ACTIVE | User_Last_Name_Text_One     | Original_Last_Name_Text_One     |
            | email_address_text | Operations | ACTIVE | User_Email_Address_Text_One | Original_Email_Address_Text_One |
            | telephone_text     | Operations | ACTIVE | User_Telephone_Text_One     | Original_Telephone_Text_One     |
            | organisation_text  | Operations | ACTIVE | User_Organisation_Text_One  | Original_Organisation_Text_One  |
            | job_title_text     | Operations | ACTIVE | User_Job_Title_Text_One     | Original_Job_Title_Text_One     |
            | role_dropdown      | Operations | ACTIVE | User_Role_Dropdown_One      | Original_Role_Dropdown_One      |

    @editUserProfileReviewer
    Scenario Outline: Successful user profile update for user as Reviewer
        And I search and click on view edit link for existing 'Active_User_Role_Reviewer' user with '<Status>' status from the manage user page
        Then I can see the view user profile details page
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And I update user profile '<Edit_User_Field_Data>' on 'Edit_User_Profile_Page'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the view user profile details page
        Then I can see the user profile '<Edit_User_Field>' is updated with the edited data '<Edit_User_Field_Data>'
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        And I update user profile '<Original_Data>' on 'Edit_User_Profile_Page'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the view user profile details page
        When I click the 'Back' link on the 'User_Profile_Page'
        Then I can see the manage users list page
        Examples:
            | Edit_User_Field    | User_Role  | Status | Edit_User_Field_Data        | Original_Data                   |
            | title_text         | Reviewer   | ACTIVE | User_Title_Text_Two         | Original_Title_Text_Two         |
            | first_name_text    | Reviewer   | ACTIVE | User_First_Name_Text_Two    | Original_First_Name_Text_Two    |
            | last_name_text     | Reviewer   | ACTIVE | User_Last_Name_Text_Two     | Original_Last_Name_Text_Two     |
            | email_address_text | Reviewer   | ACTIVE | User_Email_Address_Text_Two | Original_Email_Address_Text_Two |
            | telephone_text     | Reviewer   | ACTIVE | User_Telephone_Text_Two     | Original_Telephone_Text_Two     |
            | organisation_text  | Reviewer   | ACTIVE | User_Organisation_Text_Two  | Original_Organisation_Text_Two  |
            | job_title_text     | Reviewer   | ACTIVE | User_Job_Title_Text_Two     | Original_Job_Title_Text_Two     |
            | role_dropdown      | Operations | ACTIVE | User_Role_Dropdown_Two      | Original_Role_Dropdown_Two      |

    @editUserProfileValidEmailAddress
    Scenario Outline: Successful user profile update with multiple combination of email address formats
        And I search and click on view edit link for existing 'Edit_User_Only_Mandatory_Fields_Data' user with '<Status>' status from the manage user page
        Then I can see the view user profile details page
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And I update user profile '<Edit_User_Field_Data>' on 'Edit_User_Profile_Page'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the view user profile details page
        Then I can see the user profile '<Edit_User_Field>' is updated with the edited data '<Edit_User_Field_Data>'
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        And I update user profile '<Original_Data>' on 'Edit_User_Profile_Page'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the view user profile details page
        When I click the 'Back' link on the 'User_Profile_Page'
        Then I can see the manage users list page
        Examples:
            | Edit_User_Field    | User_Role  | Status | Original_Data                     | Edit_User_Field_Data                  |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Dot                  |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Underscore           |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Hyphen               |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Plus                 |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Exclamation          |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Hash                 |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Dollar               |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Percentage           |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Ampersand            |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Single_Quote         |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Star                 |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Slash                |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Equal_Symbol         |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Question_Mark        |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Cap_Symbol           |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Right_Single_Quote   |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Curly_Brackets       |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Pipe_Symbol          |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Tilde_Symbol         |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Unicode              |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Special_Characters   |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Hyphen_Underscore    |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Multiple_Unicode     |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Multiple_Sub_Domains |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Domain               |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Other_Language       |
            | email_address_text | Operations | ACTIVE | Original_Email_Address_Text_Three | Valid_Email_Data_Number               |

    @editUserProfileInvalidEmailAddress
    Scenario Outline: Verify error message when an invalid email format is entered in edit user profile page
        And I search and click on view edit link for existing 'Edit_User_Only_Mandatory_Fields_Data' user with '<Status>' status from the manage user page
        Then I can see the view user profile details page
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And I update user profile '<Edit_User_Field_Data>' on 'Edit_User_Profile_Page'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        Then I validate '<Invalid_Email_Id_Error_Message>' is displayed on edit user profile page for '<Edit_User_Field_Data>'
        Examples:
            | Edit_User_Field    | User_Role  | Status | Edit_User_Field_Data                               | Invalid_Email_Id_Error_Message |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Id                                   | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Incorrect_Format                                   | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Start_With_Dot                  | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Double_Dot                      | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Space                           | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Wrong_AT                        | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Less_Greater_Symbols            | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Colon                           | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Semi_Colon                      | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Comma                           | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Start_With_Hyphen               | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Hyphen_Before_Domain            | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Double_Dot_Domain               | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Exclamation_Domain              | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Unicode                         | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Single_Quote_Before_AT          | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Domain_Exceed_Max               | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Local_Part_Max                  | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Consecutive_Dot_Domain          | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Consecutive_Dot_SubDomain       | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Consecutiv_Dot_Domain_SubDomain | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Emoji                           | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_TLD                             | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Missing_AT                      | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Reserved_Domain                 | invalid_email_id_error         |
            | email_address_text | Operations | ACTIVE | Invalid_Email_Data_Punycode                        | invalid_email_id_error         |

    @editUserProfileOnlyMandatoryFields
    Scenario Outline: Successful user profile update with only mandatory fields
        And I search and click on view edit link for existing 'Edit_User_Only_Mandatory_Fields_Data' user with '<Status>' status from the manage user page
        Then I can see the view user profile details page
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And I update user profile '<Edit_User_Field_Data>' on 'Edit_User_Profile_Page'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the view user profile details page
        Then I can see the user profile '<Edit_User_Field>' is updated with the edited data '<Edit_User_Field_Data>'
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        And I update user profile '<Original_Data>' on 'Edit_User_Profile_Page'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the view user profile details page
        When I click the 'Back' link on the 'User_Profile_Page'
        Then I can see the manage users list page
        Examples:
            | Edit_User_Field    | User_Role  | Status | Edit_User_Field_Data          | Original_Data                     |
            | first_name_text    | Operations | ACTIVE | User_First_Name_Text_Three    | Original_First_Name_Text_Three    |
            | last_name_text     | Operations | ACTIVE | User_Last_Name_Text_Three     | Original_Last_Name_Text_Three     |
            | email_address_text | Operations | ACTIVE | User_Email_Address_Text_Three | Original_Email_Address_Text_Three |

    @editUserProfileMandatoryFieldsValidation
    Scenario Outline: Verify error message when mandatory fields are left blank on edit user profile page
        And I search and click on view edit link for existing 'Edit_User_Only_Mandatory_Fields_Data' user with '<Status>' status from the manage user page
        Then I can see the view user profile details page
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And I edit to remove '<Edit_User_Field>' mandatory field value
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        Then I validate '<Mandatory_Field_Error_Message>' is displayed on edit user profile page for '<Edit_User_Field_Data>'
        Examples:
            | Edit_User_Field    | User_Role  | Status | Edit_User_Field_Data     | Mandatory_Field_Error_Message |
            | first_name_text    | Operations | ACTIVE | empty_first_name_text    | first_name_mandatory_error    |
            | last_name_text     | Operations | ACTIVE | empty_last_name_text     | last_name_mandatory_error     |
            | email_address_text | Operations | ACTIVE | empty_email_address_text | email_address_mandatory_error |

    @editUserProfileMaxFieldLengthValidation
    Scenario Outline: Verify error message for field input exceeding maximum length on edit user profile page
        And I search and click on view edit link for existing 'Edit_User_Only_Mandatory_Fields_Data' user with '<Status>' status from the manage user page
        Then I can see the view user profile details page
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And I update user profile '<Edit_User_Field_Data>' on 'Edit_User_Profile_Page'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        Then I validate '<Max_Field_Length_Error_Message>' is displayed on edit user profile page for '<Edit_User_Field_Data>'
        Examples:
            | Edit_User_Field   | User_Role  | Status | Edit_User_Field_Data       | Max_Field_Length_Error_Message |
            | title_text        | Operations | ACTIVE | User_Title_Text_Max        | max_field_length_error         |
            | first_name_text   | Operations | ACTIVE | User_First_Name_Text_Max   | max_field_length_error         |
            | last_name_text    | Operations | ACTIVE | User_Last_Name_Text_Max    | max_field_length_error         |
            | telephone_text    | Operations | ACTIVE | User_Telephone_Text_Max    | max_field_length_error         |
            | organisation_text | Operations | ACTIVE | User_Organisation_Text_Max | max_field_length_error         |
            | job_title_text    | Operations | ACTIVE | User_Job_Title_Text_Max    | max_field_length_error         |
