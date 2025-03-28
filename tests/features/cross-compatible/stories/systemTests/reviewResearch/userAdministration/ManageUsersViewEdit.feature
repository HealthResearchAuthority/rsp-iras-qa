@UserAdministration  @EditViewUsers @adminUser @SystemTest
Feature: HRAPROG-393- User Administration: Manage user profiles

    Background:
        Given I have navigated to the 'Home_Page'
        When I click the 'Manage_Users' link on the 'Home_Page'
        Then I can see the Manage users list page

    @rsp-2830-view-user_operations
    Scenario Outline: View User profile details for the user with role as Operations
        And I search and click on View_edit link for '<View_User_Profile>' user with '<Status>' status from the manage user page
        Then I can see the view user profile details page for '<Status>' user
        And I click the 'Back' button on the 'User_Profile_Page'
        Then I can see the Manage users list page
        And I click the 'Back' button on the 'Manage_Users_Page'
        Then I have navigated to the 'Home_Page'

        Examples:
            | View_User_Profile             | Status   |
            | Active_User_Role_Operations   | ACTIVE   |
            | Disabled_User_Role_Operations | DISABLED |

    @rsp-2830-view-user_reviewer
    Scenario Outline: View User profile details for the user with role as reviewer
        And I search and click on View_edit link for '<View_User_Profile>' user with '<Status>' status from the manage user page
        Then I can see the view user profile details page for '<Status>' user
        And I click the 'Back' button on the 'User_Profile_Page'
        Then I can see the Manage users list page
        And I click the 'Back' button on the 'Manage_Users_Page'
        Then I have navigated to the 'Home_Page'

        Examples:
            | View_User_Profile           | Status   |
            | Active_User_Role_Reviewer   | ACTIVE   |
            | Disabled_User_Role_Reviewer | DISABLED |

    @rsp-2828-edit-user
    Scenario Outline: Successful user profile update with all fields
        And I search and click on View_edit link for 'Before_Edit_User_Valid_Data' user with '<Status>' status from the manage user page
        Then I can see the view user profile details page for '<Status>' user
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And I update user profile '<Edit_User_Field_Data>' on 'Edit_User_Profile_Page'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the view user profile details page for '<Status>' user
        Then I can see the user profile '<Edit_User_Field>' is updated in user profile page
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        And I update user profile '<Original_Data>' on 'Edit_User_Profile_Page'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the view user profile details page for '<Status>' user
        When I click the 'Back' link on the 'User_Profile_Page'
        Then I can see the Manage users list page
        Examples:
            | Edit_User_Field    | User_Role  | Status | Edit_User_Field_Data      | Original_Data                 |
            | title_text         | Operations | ACTIVE | User_Title_Text_1         | Original_Title_Text_1         |
            | first_name_text    | Operations | ACTIVE | User_First_Name_Text_1    | Original_First_Name_Text_1    |
            | last_name_text     | Operations | ACTIVE | User_Last_Name_Text_1     | Original_Last_Name_Text_1     |
            | email_address_text | Operations | ACTIVE | User_Email_Address_Text_1 | Original_Email_Address_Text_1 |
            | telephone_text     | Operations | ACTIVE | User_Telephone_Text_1     | Original_Telephone_Text_1     |
            | organisation_text  | Operations | ACTIVE | User_Organisation_Text_1  | Original_Organisation_Text_1  |
            | job_title_text     | Operations | ACTIVE | User_Job_Title_Text_1     | Original_Job_Title_Text_1     |
            | role_dropdown      | Operations | ACTIVE | User_Role_Dropdown_1      | Original_Role_Dropdown_1      |
            | country_checkbox   | Operations | ACTIVE | User_Country_Checkbox_1   | Original_Country_Checkbox_1   |

    @rsp-2828-edit-user
    Scenario Outline: Successful user profile update with only mandatory fields
        And I search and click on View_edit link for 'Edit_User_Only_Mandatory_Fields_Data' user with '<Status>' status from the manage user page
        Then I can see the view user profile details page for '<Status>' user
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And I update user profile '<Edit_User_Field_Data>' on 'Edit_User_Profile_Page'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the view user profile details page for '<Status>' user
        Then I can see the user profile '<Edit_User_Field>' is updated in user profile page

        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        And I update user profile '<Original_Data>' on 'Edit_User_Profile_Page'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the view user profile details page for '<Status>' user
        When I click the 'Back' link on the 'User_Profile_Page'
        Then I can see the Manage users list page
        Examples:
            | Edit_User_Field    | User_Role  | Status | Edit_User_Field_Data      | Original_Data                 |
            | first_name_text    | Operations | ACTIVE | User_First_Name_Text_2    | Original_First_Name_Text_2    |
            | last_name_text     | Operations | ACTIVE | User_Last_Name_Text_2     | Original_Last_Name_Text_2     |
            | email_address_text | Operations | ACTIVE | User_Email_Address_Text_2 | Original_Email_Address_Text_2 |

    @rsp-2828-edit-user
    Scenario Outline: Error message validation for missing mandatory fields
        And I search and click on View_edit link for 'Edit_User_Only_Mandatory_Fields_Data' user with '<Status>' status from the manage user page
        Then I can see the view user profile details page for '<Status>' user
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

    @rsp-2828-edit-user
    Scenario Outline: Error message validation for maximum field length
        And I search and click on View_edit link for 'Edit_User_Only_Mandatory_Fields_Data' user with '<Status>' status from the manage user page
        Then I can see the view user profile details page for '<Status>' user
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
