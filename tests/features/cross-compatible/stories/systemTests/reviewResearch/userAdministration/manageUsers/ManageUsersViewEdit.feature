@UserAdministration @ManageUsers @EditViewUsers @SysAdminUser @SystemTest
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

  @rsp-2830 @viewActiveAndDisabledUserProfile
  Scenario Outline: View User profile details for an active and disabled user
    When I enter 'QA Automation' into the search field
    And I capture the page screenshot
    And I click the 'Search' button on the 'Manage_Users_Page'
    And I capture the page screenshot
    And I select a 'QA Automation' User to View and Edit which is '<Status>'
    Then I can see the user profile page
    And I capture the page screenshot
    And I click the 'Back' link on the 'User_Profile_Page'
    Then I can see the 'Manage_Users_Page'
    And I capture the page screenshot
    And I click the 'Back' link on the 'Manage_Users_Page'
    Then I have navigated to the 'Home_Page'
    And I capture the page screenshot

    Examples:
      | Status   |
      | ACTIVE   |
      | DISABLED |

  @rsp-2828 @editUserProfileDetails
  Scenario Outline: Verify that user can edit the user profile details
    When I enter 'QA Automation' into the search field
    And I capture the page screenshot
    And I click the 'Search' button on the 'Manage_Users_Page'
    And I capture the page screenshot
    And I select a 'QA Automation' User to View and Edit which is '<Status>'
    Then I can see the user profile page
    And I capture the page screenshot
    When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
    Then I can see the edit user profile page
    And I capture the page screenshot
    And I update user profile with '<Edit_User_Field_Data>'
    And I capture the page screenshot
    And I click the 'Save' button on the 'Edit_User_Profile_Page'
    And I can see the user profile page
    And I capture the page screenshot
    Then I can see the user profile '<Edit_User_Field>' is updated with the edited data '<Edit_User_Field_Data>'

    Examples:
      | Edit_User_Field   | User_Role  | Status  | Edit_User_Field_Data       |
      | title_text        | Operations | Enabled | User_Title_Text_One        |
      | first_name_text   | Operations | Enabled | User_First_Name_Text_One   |
      | last_name_text    | Operations | Enabled | User_Last_Name_Text_One    |
      | telephone_text    | Operations | Enabled | User_Telephone_Text_One    |
      | organisation_text | Operations | Enabled | User_Organisation_Text_One |
      | job_title_text    | Operations | Enabled | User_Job_Title_Text_One    |
      | role_checkbox     | Operations | Enabled | User_Role_Checkbox_One     |

  @rsp-2828 @editUserProfileOnlyMandatoryFields
  Scenario Outline: Successful user profile update with only mandatory fields
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Manage_Users_Page'
    And I capture the page screenshot
    And I select a 'QA Automation' User to View and Edit which is '<Status>'
    Then I can see the user profile page
    And I capture the page screenshot
    When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
    Then I can see the edit user profile page
    And I capture the page screenshot
    And I update user profile with '<Edit_User_Field_Data>'
    And I click the 'Save' button on the 'Edit_User_Profile_Page'
    And I capture the page screenshot
    And I can see the user profile page
    Then I can see the user profile '<Edit_User_Field>' is updated with the edited data '<Edit_User_Field_Data>'
    And I capture the page screenshot

    Examples:
      | Edit_User_Field | User_Role  | Status  | Edit_User_Field_Data     |
      | first_name_text | Operations | Enabled | User_First_Name_Text_One |
      | last_name_text  | Operations | Enabled | User_Last_Name_Text_One  |

  @rsp-3122 @VerifyErrorMessagesInvalidData @EditUserProfileVerifyErrorMessagesInvalidData
  Scenario Outline: Validate error messages are displayed for invalid data in edit user profile page
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Manage_Users_Page'
    And I select a 'QA Automation' User to View and Edit which is '<Status>'
    Then I can see the user profile page
    When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
    Then I can see the edit user profile page
    And I uncheck the previously selected checkboxes on the edit user profile page for '<Edit_User_Profile>' when the role is selected as study-wide reviewer or team manager or workflow co-ordinator
    And I update user profile with '<Invalid_Data_Edit_User>'
    And I click the 'Save' button on the 'Edit_User_Profile_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Edit_User_Profile_Page'

    Examples:
      | Edit_User_Profile                                  | Edit_User_Field | User_Role             | Status  | Invalid_Data_Edit_User                                                 | Field_And_Summary_Error_Message                                              |
      | Valid_Data_In_All_Fields_Role_Team_Manager         | title_text      | Team Manager          | Enabled | Missing_Mandatory_Fields_Role_Team_Manager                             | Missing_Mandatory_Fields_Role_Team_Manager_Error                             |
      | Valid_Data_In_All_Fields_Role_Studywide_Reviewer   | first_name_text | Study-wide reviewer   | Enabled | Missing_Mandatory_Fields_Role_Studywide_Reviewer                       | Missing_Mandatory_Fields_Role_Studywide_Reviewer_Error                       |
      | Valid_Data_In_All_Fields_Role_Workflow_Coordinator | last_name_text  | workflow co-ordinator | Enabled | Missing_Mandatory_Fields_Role_Workflow_Coordinator                     | Missing_Mandatory_Fields_Role_Workflow_Coordinator_Error                     |
      | Valid_Data_In_All_Fields_Role_Team_Manager         | telephone_text  | Team Manager          | Enabled | Missing_Mandatory_Field_Country_Role_Team_Manager                      | Missing_Mandatory_Field_Country_Role_Team_Manager_Error                      |
      | Valid_Data_In_All_Fields_Role_Workflow_Coordinator | telephone_text  | workflow co-ordinator | Enabled | Missing_Mandatory_Field_Review_Body_Role_Workflow_Coordinator          | Missing_Mandatory_Field_Review_Body_Role_Workflow_Coordinator_Error          |
      | Valid_Data_In_All_Fields_Role_Studywide_Reviewer   | job_title_text  | Study-wide reviewer   | Enabled | Missing_Mandatory_Field_Review_Body_Role_Studywide_Reviewer            | Missing_Mandatory_Field_Review_Body_Role_Studywide_Reviewer_Error            |
      | Valid_Data_In_All_Fields_Role_Team_Manager         | job_title_text  | Team Manager          | Enabled | Invalid_Character_Limit                                                | Invalid_Character_Limit_Error                                                |
      | Valid_Data_In_All_Fields_Role_Team_Manager         | job_title_text  | Team Manager          | Enabled | Incorrect_Format_Telephone_Data                                        | Incorrect_Format_Field_Telephone_Error                                       |
      | Valid_Data_In_All_Fields_Role_Team_Manager         | job_title_text  | Team Manager          | Enabled | Incorrect_Format_Invalid_Character_Limit_Telephone_Data                | Incorrect_Format_Invalid_Character_Limit_Telephone_Error                     |
      | Valid_Data_In_All_Fields_Role_System_Administrator | job_title_text  | System administrator  | Enabled | Missing_Mandatory_Field_First_Name_Role_Applicant_System_Administrator | Missing_Mandatory_Field_First_Name_Role_Applicant_System_Administrator_Error |
      | Valid_Data_In_All_Fields_Role_System_Administrator | job_title_text  | System administrator  | Enabled | Missing_Mandatory_Field_Last_Name_Role_Applicant_System_Administrator  | Missing_Mandatory_Field_Last_Name_Role_Applicant_System_Administrator_Error  |

  @rsp-3521 @ManageUsersPagination @ManageUsersPaginationFirstPage @ManageUsersPaginationPageNumber @ManageUsersPaginationNextLinkClick
  Scenario Outline: Verify pagination in manage users page when user is on the first page and navigate through each page by clicking page number or by by clicking next link
    And I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the default page size should be 'twenty'
    And the 'Next' button will be 'available' to the user
    And the 'Previous' button will be 'not available' to the user
    And the current page number should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    Then I sequentially navigate through each 'Manage_Users_Page' by clicking on '<Navigation_Method>' from first page to verify pagination results, surrounding pages, and ellipses for skipped ranges
    And I capture the page screenshot

    Examples:
      | Navigation_Method |
      | page number       |
      | next link         |

  @rsp-3521 @ManageUsersPagination @ManageUsersPaginationLastPage @ManageUsersPaginationPageNumber @ManageUsersPaginationPreviousLinkClick
  Scenario Outline: Verify pagination in manage users page when user is on the last page and navigate through each page by clicking page number or by by clicking on previous link
    And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
    And I capture the page screenshot
    And the 'Previous' button will be 'available' to the user
    And the 'Next' button will be 'not available' to the user
    And I capture the page screenshot
    Then I sequentially navigate through each 'Manage_Users_Page' by clicking on '<Navigation_Method>' from last page to verify pagination results, surrounding pages, and ellipses for skipped ranges
    And I capture the page screenshot

    Examples:
      | Navigation_Method |
      | page number       |
      | previous link     |

  @rsp-3456 @ManageUsersSearchResultsFound
  Scenario Outline: Verify search results in manage users page when user search by first value of first name, last name, full name and email address
    And I capture the page screenshot
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

  @rsp-3456 @ManageUsersSearchResultsFound
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
    When I fill the search input for searching 'users' with '<Search_Query>' as the search query
    And I capture the page screenshot
    And I click the 'Search' button on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then the search displays no matching results
    And I capture the page screenshot

    Examples:
      | Search_Query           |
      | Non_Existant_User_Data |

  @rsp-3456 @ManageUsersSearchAndPagination
  Scenario Outline: Verify search results and pagination in manage users page when user searches and navigate through each page
    When I fill the search input for searching 'users' with '<Search_Query>' as the search query
    And I capture the page screenshot
    And I click the 'Search' button on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then the system displays user records matching the search criteria
    And I capture the page screenshot

    Examples:
      | Search_Query                |
      | Existing_QA_User_First_Name |
      | Existing_QA_User_Last_Name  |
      | Existing_QA_User_Email      |

  # out of scope for now-since the search box does not support special characters,it may be added in future
  # @rsp-3456 @ManageUsersSearchLeadingAndTrailingWhiteSpaces
  # Scenario Outline: Verify search results in manage users page when the search keyword contains leading and trailing white spaces
  #   When I fill the search input for searching 'users' with '<Search_Query>' as the search query
  #   And I capture the page screenshot
  #   And I click the 'Search' button on the 'Manage_Users_Page'
  #   And I capture the page screenshot
  #   Then the system displays user records matching the search criteria
  #   And I capture the page screenshot

  #   Examples:
  #     | Search_Query                               |
  #     | Leading_White_Space_User_Data              |
  #     | Leading_And_Trailing_White_Space_User_Data |
  #     | Trailing_White_Space_User_Data             |

  @rsp-3890 @ManageUsersSearchMultiTerms @fail @skip
  Scenario Outline: Verify the user search utilises AND logic to produce accurate search results
    When I fill the search input for searching 'users' with '<Initial_Search_Query>' as the search query
    And I capture the page screenshot
    And I click the 'Search' button on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then the system displays user records matching the search criteria
    And the list displays 'multiple user records'
    And I capture the page screenshot
    When I fill the search input for searching 'users' with '<Second_Search_Query>' as the search query
    And I capture the page screenshot
    And I click the 'Search' button on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then the system displays user records matching the search criteria
    And the list displays 'a single user record'
    And I capture the page screenshot

    Examples:
      | Initial_Search_Query              | Second_Search_Query             |
      | Admin_User_Full_Name_Email_Prefix | Admin_User_Full_Name_Full_Email |

  @rsp-4021 @ManageUsersEmailNotEditable
  Scenario Outline: Verify the user is not able to edit the email address
    When I enter 'Existing_QA_Automation_User_First_Name' into the search field for manage users page
    And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
    And I select advanced filters in the manage users page using 'Advanced_Filter_Status_Active'
    And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
    And I capture the page screenshot
    And I select a 'QA Automation' User to View and Edit which is 'active'
    And I can see the user profile page
    And I validate change link is not displayed for '<Field_Name_One>'
    And I capture the page screenshot
    When I click the change link against '<Field_Name_Two>' on the user profile page
    Then I can see the edit user profile page
    And I validate '<Field_Name_One>' is not displayed for edit user profile page
    And I capture the page screenshot

    Examples:
      | Field_Name_One | Field_Name_Two |
      | Email_Address  | First_Name     |
