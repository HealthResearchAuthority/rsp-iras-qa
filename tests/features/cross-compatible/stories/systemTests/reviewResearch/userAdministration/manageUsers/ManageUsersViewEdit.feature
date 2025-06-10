@UserAdministration @ManageUsers @EditViewUsers @SysAdminUser @SystemTest @rsp-2830 @rsp-2828
Feature: User Administration: Manage user profiles, view and edit user profile
    As a user
    I want the ability to edit and view a user profile record
    So that I can access all the user information and keep user information up to date

    Background:
        Given I have navigated to the 'Home_Page'
        When I click the 'System_Administration' link on the 'Home_Page'
        Then I can see the system administration home page
        When I click the 'Manage_Users' link on the 'System_Administration_Page'
        Then I can see the 'Manage_Users_Page'

    @viewUserProfileRoleOperations @skip
    Scenario Outline: View User profile details for the user with role as Operations
        And I search and click on view edit link for existing '<View_User_Profile>' user with '<Status>' status from the manage user page
        Then I can see the user profile page
        And I click the 'Back' link on the 'User_Profile_Page'
        Then I can see the 'Manage_Users_Page'
        And I click the 'Back' link on the 'Manage_Users_Page'
        Then I have navigated to the 'Home_Page'

        Examples:
            | View_User_Profile             | Status   |
            | Active_User_Role_Operations   | ACTIVE   |
            | Disabled_User_Role_Operations | DISABLED |

    @viewUserProfileRoleReviewer @skip
    Scenario Outline: View User profile details for the user with role as reviewer
        And I search and click on view edit link for existing '<View_User_Profile>' user with '<Status>' status from the manage user page
        Then I can see the user profile page
        And I click the 'Back' link on the 'User_Profile_Page'
        Then I can see the 'Manage_Users_Page'
        And I click the 'Back' link on the 'Manage_Users_Page'
        Then I have navigated to the 'Home_Page'

        Examples:
            | View_User_Profile           | Status   |
            | Active_User_Role_Reviewer   | ACTIVE   |
            | Disabled_User_Role_Reviewer | DISABLED |

    @editUserProfileOperations @skip
    Scenario Outline: Successful user profile update for user role as Operations
        And I search and click on view edit link for existing 'Valid_Data_Role_Operations' user with '<Status>' status from the manage user page
        Then I can see the user profile page
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And I update user profile with '<Edit_User_Field_Data>'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the user profile page
        Then I can see the user profile '<Edit_User_Field>' is updated with the edited data '<Edit_User_Field_Data>'
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        And I update user profile with '<Original_Data>'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the user profile page
        When I click the 'Back' link on the 'User_Profile_Page'
        Then I can see the 'Manage_Users_Page'
        Examples:
            | Edit_User_Field    | User_Role  | Status  | Edit_User_Field_Data        | Original_Data                   |
            | title_text         | Operations | Enabled | User_Title_Text_One         | Original_Title_Text_One         |
            | first_name_text    | Operations | Enabled | User_First_Name_Text_One    | Original_First_Name_Text_One    |
            | last_name_text     | Operations | Enabled | User_Last_Name_Text_One     | Original_Last_Name_Text_One     |
            | email_address_text | Operations | Enabled | User_Email_Address_Text_One | Original_Email_Address_Text_One |
            | telephone_text     | Operations | Enabled | User_Telephone_Text_One     | Original_Telephone_Text_One     |
            | organisation_text  | Operations | Enabled | User_Organisation_Text_One  | Original_Organisation_Text_One  |
            | job_title_text     | Operations | Enabled | User_Job_Title_Text_One     | Original_Job_Title_Text_One     |
            | role_checkbox      | Operations | Enabled | User_Role_Checkbox_One      | Original_Role_Checkbox_One      |

    @editUserProfileReviewer @skip
    Scenario Outline: Successful user profile update for user as Reviewer
        And I search and click on view edit link for existing 'Active_User_Role_Reviewer' user with '<Status>' status from the manage user page
        Then I can see the user profile page
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And I update user profile with '<Edit_User_Field_Data>'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the user profile page
        Then I can see the user profile '<Edit_User_Field>' is updated with the edited data '<Edit_User_Field_Data>'
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        And I update user profile with '<Original_Data>'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the user profile page
        When I click the 'Back' link on the 'User_Profile_Page'
        Then I can see the 'Manage_Users_Page'
        Examples:
            | Edit_User_Field    | User_Role  | Status  | Edit_User_Field_Data        | Original_Data                   |
            | title_text         | Reviewer   | Enabled | User_Title_Text_Two         | Original_Title_Text_Two         |
            | first_name_text    | Reviewer   | Enabled | User_First_Name_Text_Two    | Original_First_Name_Text_Two    |
            | last_name_text     | Reviewer   | Enabled | User_Last_Name_Text_Two     | Original_Last_Name_Text_Two     |
            | email_address_text | Reviewer   | Enabled | User_Email_Address_Text_Two | Original_Email_Address_Text_Two |
            | telephone_text     | Reviewer   | Enabled | User_Telephone_Text_Two     | Original_Telephone_Text_Two     |
            | organisation_text  | Reviewer   | Enabled | User_Organisation_Text_Two  | Original_Organisation_Text_Two  |
            | job_title_text     | Reviewer   | Enabled | User_Job_Title_Text_Two     | Original_Job_Title_Text_Two     |
            | role_checkbox      | Operations | Enabled | User_Role_Checkbox_Two      | Original_Role_Checkbox_Two      |

    @editUserProfileOnlyMandatoryFields @skip
    Scenario Outline: Successful user profile update with only mandatory fields
        And I search and click on view edit link for existing 'Edit_User_Only_Mandatory_Fields_Data' user with '<Status>' status from the manage user page
        Then I can see the user profile page
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And I update user profile with '<Edit_User_Field_Data>'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the user profile page
        Then I can see the user profile '<Edit_User_Field>' is updated with the edited data '<Edit_User_Field_Data>'
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        And I update user profile with '<Original_Data>'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the user profile page
        When I click the 'Back' link on the 'User_Profile_Page'
        Then I can see the 'Manage_Users_Page'
        Examples:
            | Edit_User_Field    | User_Role  | Status  | Edit_User_Field_Data          | Original_Data                     |
            | first_name_text    | Operations | Enabled | User_First_Name_Text_Three    | Original_First_Name_Text_Three    |
            | last_name_text     | Operations | Enabled | User_Last_Name_Text_Three     | Original_Last_Name_Text_Three     |
            | email_address_text | Operations | Enabled | User_Email_Address_Text_Three | Original_Email_Address_Text_Three |

    @editUserProfileValidEmailAddress @skip
    Scenario Outline: Successful user profile update with multiple combination of email address formats
        And I search and click on view edit link for existing 'Edit_User_Only_Mandatory_Fields_Data' user with '<Status>' status from the manage user page
        Then I can see the user profile page
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And I update user profile with '<Edit_User_Field_Data>'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the user profile page
        Then I can see the user profile '<Edit_User_Field>' is updated with the edited data '<Edit_User_Field_Data>'
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        And I update user profile with '<Original_Data>'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I can see the user profile page
        When I click the 'Back' link on the 'User_Profile_Page'
        Then I can see the 'Manage_Users_Page'
        Examples:
            | Edit_User_Field    | User_Role  | Status  | Original_Data                     | Edit_User_Field_Data                  |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Dot                  |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Underscore           |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Hyphen               |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Plus                 |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Exclamation          |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Hash                 |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Dollar               |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Percentage           |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Ampersand            |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Single_Quote         |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Star                 |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Slash                |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Equal_Symbol         |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Question_Mark        |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Cap_Symbol           |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Right_Single_Quote   |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Curly_Brackets       |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Pipe_Symbol          |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Tilde_Symbol         |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Unicode              |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Special_Characters   |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Hyphen_Underscore    |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Multiple_Unicode     |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Multiple_Sub_Domains |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Domain               |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Other_Language       |
            | email_address_text | Operations | Enabled | Original_Email_Address_Text_Three | Valid_Email_Data_Number               |


    @rsp-3122 @VerifyErrorMessagesInvalidData @EditUserProfileVerifyErrorMessagesInvalidData
    Scenario Outline: Validate error messages are displayed for invalid data in edit user profile page
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Users_Page'
        And I select a 'QA Automation' User to View and Edit which is '<Status>'
        Then I can see the user profile page
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And  I uncheck the previously selected checkboxes on the edit user profile page for '<Edit_User_Profile>' when the role is selected as operations
        And I update user profile with '<Invalid_Data_Edit_User>'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Edit_User_Profile_Page'
        Examples:
            | Edit_User_Profile                        | Edit_User_Field   | User_Role  | Status  | Invalid_Data_Edit_User                                    | Field_And_Summary_Error_Message                                 |
            | Valid_Data_In_All_Fields_Role_Operations | title_text        | Operations | Enabled | Missing_Mandatory_Fields_Role_Not_Operations              | Missing_Mandatory_Fields_Role_Not_Operations_Error              |
            | Valid_Data_In_All_Fields_Role_Operations | first_name_text   | Operations | Enabled | Missing_Mandatory_Fields_Role_Operations                  | Missing_Mandatory_Fields_Role_Operations_Error                  |
            | Valid_Data_In_All_Fields_Role_Operations | last_name_text    | Operations | Enabled | Missing_Mandatory_Field_First_Name_Role_Not_Operations    | Missing_Mandatory_Field_First_Name_Role_Not_Operations_Error    |
            | Valid_Data_In_All_Fields_Role_Operations | telephone_text    | Operations | Enabled | Missing_Mandatory_Field_Last_Name_Role_Not_Operations     | Missing_Mandatory_Field_Last_Name_Role_Not_Operations_Error     |
            | Valid_Data_In_All_Fields_Role_Operations | organisation_text | Operations | Enabled | Missing_Mandatory_Field_Email_Address_Role_Not_Operations | Missing_Mandatory_Field_Email_Address_Role_Not_Operations_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text    | Operations | Enabled | Missing_Mandatory_Field_Country_Role_Operations           | Missing_Mandatory_Field_Country_Role_Operations_Error           |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text    | Operations | Enabled | Missing_Mandatory_Field_Access_Required_Role_Operations   | Missing_Mandatory_Field_Access_Required_Role_Operations_Error   |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text    | Operations | Enabled | Invalid_Character_Limit                                   | Invalid_Character_Limit_Error                                   |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text    | Operations | Enabled | Invalid_Email_Data_Max_Char                               | Invalid_Character_Limit_field_Email_Address_Error               |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text    | Operations | Enabled | Incorrect_Format_Telephone_Data                           | Incorrect_Format_Field_Telephone_Error                          |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text    | Operations | Enabled | Incorrect_Format_Invalid_Character_Limit_Telephone_Data   | Incorrect_Format_Invalid_Character_Limit_Telephone_Error        |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text    | Operations | Enabled | Incorrect_Format_Invalid_Character_Limit_Email_Data       | Incorrect_Format_Invalid_Character_Limit_Email_Address_Error    |

    @rsp-3122 @VerifyErrorMessagesInvalidData @EditUserProfileVerifyErrorMessagesInvalidData @skip
    Scenario Outline: Validate error messages are displayed for invalid data in the email address field of edit user profile page
        And I select a 'QA Automation' User to View and Edit which is '<Status>'
        Then I can see the user profile page
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        Then I can see the edit user profile page
        And  I uncheck the previously selected checkboxes on the edit user profile page for '<Edit_User_Profile>' when the role is selected as operations
        And I update user profile with '<Invalid_Data_Edit_User>'
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Edit_User_Profile_Page'
        Examples:
            | Edit_User_Profile                        | Edit_User_Field | User_Role  | Status  | Invalid_Data_Edit_User                             | Field_And_Summary_Error_Message            |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Incorrect_Format_Email                             | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Start_With_Dot                  | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Double_Dot                      | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Space                           | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Wrong_AT                        | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Less_Greater_Symbols            | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Colon                           | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Semi_Colon                      | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Comma                           | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Start_With_Hyphen               | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Hyphen_Before_Domain            | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Double_Dot_Domain               | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Exclamation_Domain              | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Unicode                         | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Single_Quote_Before_AT          | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Domain_Exceed_Max               | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Local_Part_Max                  | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Consecutive_Dot_Domain          | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Consecutive_Dot_SubDomain       | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Consecutiv_Dot_Domain_SubDomain | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Emoji                           | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_TLD                             | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Missing_AT                      | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Reserved_Domain                 | Incorrect_Format_Field_Email_Address_Error |
            | Valid_Data_In_All_Fields_Role_Operations | job_title_text  | Operations | Enabled | Invalid_Email_Data_Punycode                        | Incorrect_Format_Field_Email_Address_Error |


    @rsp-3521 @ManageUsersPagination @ManageUsersPaginationFirstPage @ManageUsersPaginationPageNumber
    Scenario: Verify pagination in manage users page when user is on the first page and navigate through each page by clicking page number
        And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then the pagination controls should be displayed at the bottom of the page
        And the default page size should be twenty
        And the 'Next' button will be 'enabled' and 'visible' to the user
        And the 'Previous' button will be 'disabled' and 'not visible' to the user
        And the current page number should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        # Then I sequentially navigate through each page by 'clicking on page number' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

    @rsp-3521 @ManageUsersPagination @ManageUsersPaginationFirstPage @ManageUsersPaginationNextLinkClick
    Scenario: Verify pagination in manage users page when user is on the first page and navigate through each page by clicking next link
        And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then the pagination controls should be displayed at the bottom of the page
        And the default page size should be twenty
        And the 'Next' button will be 'enabled' and 'visible' to the user
        And the 'Previous' button will be 'disabled' and 'not visible' to the user
        And the current page number should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        # Then I sequentially navigate through each page by 'clicking on next link' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

    @rsp-3521 @ManageUsersPagination @ManageUsersPaginationLastPage  @ManageUsersPaginationPreviousLinkClick
    Scenario: Verify pagination in manage users page when user is on the last page and navigate through each page by clicking previous link
        And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then the pagination controls should be displayed at the bottom of the page
        And the 'Next' button will be 'disabled' and 'not visible' to the user
        And the 'Previous' button will be 'enabled' and 'visible' to the user
        And I capture the page screenshot
        # Then I sequentially navigate through each page by 'clicking on previous link' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

    @rsp-3521 @ManageUsersPagination @ManageUsersPaginationLastPage  @ManageUsersPaginationPageNumber
    Scenario: Verify pagination in manage users page when user is on the last page and navigate through each page by clicking page number
        And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then the pagination controls should be displayed at the bottom of the page
        And the 'Next' button will be 'disabled' and 'not visible' to the user
        And the 'Previous' button will be 'enabled' and 'visible' to the user
        # Then I sequentially navigate through each page by 'clicking on page number' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot

    @rsp-3456 @ManageUsersSearchResultsFound @Smoke
    Scenario Outline: Verify search results in manage users page when user search by first value of first name, last name, full name and email address
        When I enter the '<Field_Name>' of the '<Position>' item in the list, into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then the system displays user records matching the search criteria
        And I capture the page screenshot
        Examples:
            | Field_Name    | Position |
            | First_Name    | First    |
            | Last_Name     | First    |
            | Email_Address | First    |
            | Full_Name     | First    |

    @rsp-3456 @ManageUsersSearchResultsFound @Smoke
    Scenario Outline: Verify search results in manage users page when user search by last value of first name, last name and email address
        When I enter the '<Field_Name>' of the '<Position>' item in the list, into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then the system displays user records matching the search criteria
        And I capture the page screenshot
        Examples:
            | Field_Name    | Position |
            | First_Name    | Last     |
            | Last_Name     | Last     |
            | Email_Address | Last     |
            | Full_Name     | Last     |

    @rsp-3456 @ManageUsersSearchNoResultsFound
    Scenario Outline: Verify no results found message will be presented to the user in manage users page if there is not a user on the system that matches the search criteria
        When I fill the search input for searching users in manage users page with '<Search_Query>' as the search query
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then the system displays no results found message if there is no 'user' on the system that matches the search criteria
        And I capture the page screenshot
        Examples:
            | Search_Query           |
            | Non_Existant_User_Data |

    @rsp-3456 @ManageUsersSearchAndPagination
    Scenario Outline: Verify search results and pagination in manage users page when user searches and navigate through each page by clicking previous link
        When I fill the search input for searching users in manage users page with '<Search_Query>' as the search query
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then the system displays user records matching the search criteria
        And I capture the page screenshot
        # Then I sequentially navigate through each page by 'clicking on previous link' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
        And I capture the page screenshot
        Examples:
            | Search_Query                |
            | Existing_QA_User_First_Name |
            | Existing_QA_User_Last_Name  |
            | Existing_QA_User_Email      |

    # out of scope for now
    @rsp-3456 @ManageUsersSearchLeadingAndTrailingWhiteSpaces @fail @skip
    Scenario Outline: Verify search results in manage users page when the search keyword contains leading and trailing white spaces
        When I fill the search input for searching users in manage users page with '<Search_Query>' as the search query
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        Then the system displays user records matching the search criteria
        And I capture the page screenshot
        Examples:
            | Search_Query                               |
            | Leading_White_Space_User_Data              |
            | Leading_And_Trailing_White_Space_User_Data |
            | Trailing_White_Space_User_Data             |

