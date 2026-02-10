@RegressionCreateManageUsers @RegressionManageUsers @Regression @SysAdminUser @BackStage
Feature: User Administration: Create and edit manage users

    @RegressionTestCreateUserEvents @RevBodyUserListCleanup @KNOWN_DEFECT_RSP_7137
    Scenario Outline: Verify the user is able to create new user profiles with various roles like study-wide reviewer or workflow co-ordinator, with an audit history log
        Given I have navigated to the 'Home_Page'
        And I click the 'System_Administration' link on the 'Home_Page'
        And I can see the system administration home page
        And I click the 'Manage_Users' link on the 'System_Administration_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
        And I can see the add a new user profile page
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
        When I enter '<Search_Queries>' into the search field for manage users page
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I select advanced filters in the manage users page using '<Advanced_Filters_Users>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
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
        And I have navigated to the 'Manage_Review_Bodies_Page'
        When I enter '<Organisation_Name>' into the search field
        And I capture the page screenshot
        And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
        And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        And I select advanced filters in the manage review bodies page using '<Advanced_Filters_Review_Bodies>'
        And I capture the page screenshot
        And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters_Review_Bodies>' in the 'Manage_Review_Bodies_Page'
        And I can see the '<Organisation_Name>' should be present in the list with 'Active' status in the manage review bodies page
        And I capture the page screenshot
        Then I click the view edit link
        And I capture the page screenshot
        And I can see the review body profile page
        And I capture the page screenshot
        And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
        And I capture the page screenshot
        Then I can see the user list page of the 'review body'
        And I capture the name of the newly added user in the user list page of the review body
        When I enter 'name of the newly created user' into the search field
        And I click the 'Search' button on the 'Review_Body_User_List_Page'
        And I capture the page screenshot
        Then the system displays search results matching the search criteria

        Examples:
            | Add_User_Profile                                   | Field_Name | Organisation_Name                                                  | Advanced_Filters_Users                                                     | Search_Queries      | Advanced_Filters_Review_Bodies |
            | Valid_Data_In_All_Fields_Role_Studywide_Reviewer   | Role       | Health Research Authority (HRA)                                    | Advanced_Filter_Review_body_HRA_Role_Studywide_Reviewer_Status_Active      | the new users email | Advanced_Filter_Eng_Active     |
            | Valid_Data_In_All_Fields_Role_Workflow_Coordinator | Role       | National Research Service Permissions Coordination Centre (NRSPCC) | Advanced_Filter_Review_body_NRSPCC_Role_Workflow_Coordinator_Status_Active | the new users email | Advanced_Filter_Sco_Active     |

    @RegressionTestCreateUserEvents
    Scenario Outline: Verify the user is able to create new user profiles with various roles like applicant or system administrator or team manager, with an audit history log
        Given I have navigated to the 'Create_User_Profile_Page'
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
        When I enter '<Search_Queries>' into the search field for manage users page
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I select advanced filters in the manage users page using '<Advanced_Filters_Users>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
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
            | Add_User_Profile                                   | Field_Name | Advanced_Filters_Users                                  | Search_Queries            |
            | Valid_Data_In_All_Fields_Role_Team_Manager         | Role       | Advanced_Filter_Role_Team_Manager_Status_Active         | Role_Team_Manager         |
            | Valid_Data_In_All_Fields_Role_System_Administrator | Role       | Advanced_Filter_Role_System_Administrator_Status_Active | Role_System_Administrator |
            | Valid_Data_In_All_Fields_Role_Applicant            | Role       | Advanced_Filter_Role_Applicant_Status_Active            | Role_Applicant            |

    @RegressionTestAddAnotherUser
    Scenario Outline: Verify the user is able to continue adding users via the link provided on the Confirmation screen
        Given I have navigated to the 'Create_User_Profile_Page'
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

    @RegressionTestUnassignUserRoles
    Scenario Outline: Verify the user can unassign roles from the user profile event, with an audit history log
        Given I have navigated to the 'Create_User_Profile_Page'
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
        Then I can see the '<Add_User_Profile>' user has had their roles unassigned in the audit history

        Examples:
            | Add_User_Profile     | Field_Name | Edit_User                 | Advanced_Filters                        | Search_Queries |
            | Valid_Data_All_Roles | Role       | User_Roles_Checkbox_Empty | Advanced_Filter_All_Roles_Status_Active | Role_All       |

    @RegressionTestEnableDisableUserProfile
    Scenario Outline: Verify the user is able to disable, then re-enable a user profile, with an audit history log
        Given I have navigated to the 'Create_User_Profile_Page'
        When I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        Then I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        When I enter '<Search_Queries>' into the search field for manage users page
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I select advanced filters in the manage users page using '<Advanced_Filters_Users>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        When I search and click on view edit link for unique '<Add_User_Profile>' user with 'ACTIVE' status from the manage user page
        Then I can see the user profile page
        And I can see the 'Disable_Label_Texts' ui labels on the user profile page
        And I capture the page screenshot
        When I click the 'Disable_User_Record' button on the 'User_Profile_Page'
        And I validate 'Disable_User_Profile_Labels' labels displayed in disable user profile confirmation page using the '<Add_User_Profile>' details
        And I capture the page screenshot
        And I click the 'Disable' button on the 'Confirmation_Page'
        And I capture the current time for 'Audit_History_User_Page'
        And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
        Then I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        When I enter '<Search_Queries>' into the search field for manage users page
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I select advanced filters in the manage users page using '<Advanced_Filters_Users_Disabled>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        When I search and click on view edit link for unique '<Add_User_Profile>' user with 'DISABLED' status from the manage user page
        Then I can see the 'Enable_Label_Texts' ui labels on the user profile page
        And I can see that the user profiles last updated field has the current time
        And I capture the page screenshot
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        And I can see the users audit history with the 'Disable_User' event as the most recent entry
        And I capture the page screenshot
        And I click the 'User_Profile_Breadcrumb' link on the 'User_Profile_Audit_History_Page'
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
        When I enter '<Search_Queries>' into the search field for manage users page
        And I capture the page screenshot
        And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I select advanced filters in the manage users page using '<Advanced_Filters_Users>'
        And I capture the page screenshot
        And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I search and click on view edit link for unique '<Add_User_Profile>' user with 'ACTIVE' status from the manage user page
        Then I can see the 'Disable_Label_Texts' ui labels on the user profile page
        And I capture the page screenshot
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        Then I can see the users audit history with the 'Enable_User' event as the most recent entry
        And I capture the page screenshot

        Examples:
            | Add_User_Profile                                   | Advanced_Filters_Users                                  | Search_Queries            | Advanced_Filters_Users_Disabled                           |
            | Valid_Data_In_All_Fields_Role_Team_Manager         | Advanced_Filter_Role_Team_Manager_Status_Active         | Role_Team_Manager         | Advanced_Filter_Role_Team_Manager_Status_Disabled         |
            | Valid_Data_In_All_Fields_Role_Studywide_Reviewer   | Advanced_Filter_Role_Studywide_Reviewer_Status_Active   | Role_Studywide_Reviewer   | Advanced_Filter_Role_Studywide_Reviewer_Status_Disabled   |
            | Valid_Data_In_All_Fields_Role_Workflow_Coordinator | Advanced_Filter_Role_Workflow_Coordinator_Status_Active | Role_Workflow_Coordinator | Advanced_Filter_Role_Workflow_Coordinator_Status_Disabled |
            | Valid_Data_In_All_Fields_Role_System_Administrator | Advanced_Filter_Role_System_Administrator_Status_Active | Role_System_Administrator | Advanced_Filter_Role_System_Administrator_Status_Disabled |
            | Valid_Data_In_All_Fields_Role_Applicant            | Advanced_Filter_Role_Applicant_Status_Active            | Role_Applicant            | Advanced_Filter_Role_Applicant_Status_Disabled            |

    @RegressionTestCreateUserProfileBackLinks @KNOWN_DEFECT_RSP_7137
    Scenario Outline: Verify the user can navigate from 'Check and create user profile' back to system admin page via the 'Back' links
        Given I have navigated to the 'Create_User_Profile_Page'
        When I fill the new user profile page using '<Add_User_Profile>'
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        And I capture the page screenshot
        When I click the 'Back' button on the 'Check_Create_User_Profile_Page'
        Then I can see the add a new user profile page
        And I capture the page screenshot
        When I click the 'Back' link on the 'Create_User_Profile_Page'
        Then I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        When I click the 'System_Admin_Breadcrumb' link on the 'Manage_Users_Page'
        Then I can see the 'System_Administration_Page'
        And I capture the page screenshot

        Examples:
            | Add_User_Profile                                   |
            | Valid_Data_In_All_Fields_Role_System_Administrator |

    @RegressionTestCreateUserErrorMessagesInvalidData
    Scenario Outline: Validate relevant error messages are displayed for invalid data entry on the create user profile page
        Given I have navigated to the 'Create_User_Profile_Page'
        When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
        And I capture the page screenshot
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Create_User_Profile_Page'
        And I capture the page screenshot

        Examples:
            | Invalid_Data_User_Profile                                                 | Field_And_Summary_Error_Message                                                 |
            | Missing_Mandatory_Fields_Role_Applicant                                   | Missing_Mandatory_Fields_Role_Applicant_Error                                   |
            | Missing_Mandatory_Fields_Role_System_Administrator                        | Missing_Mandatory_Fields_Role_System_Administrator_Error                        |
            | Missing_Mandatory_Fields_Role_Team_Manager                                | Missing_Mandatory_Fields_Role_Team_Manager_Error                                |
            | Missing_Mandatory_Fields_Role_Studywide_Reviewer                          | Missing_Mandatory_Fields_Role_Studywide_Reviewer_Error                          |
            | Missing_Mandatory_Fields_Role_Workflow_Coordinator                        | Missing_Mandatory_Fields_Role_Workflow_Coordinator_Error                        |
            | Missing_Mandatory_Field_First_Name_Role_Applicant_System_Administrator    | Missing_Mandatory_Field_First_Name_Role_Applicant_System_Administrator_Error    |
            | Missing_Mandatory_Field_Last_Name_Role_Applicant_System_Administrator     | Missing_Mandatory_Field_Last_Name_Role_Applicant_System_Administrator_Error     |
            | Missing_Mandatory_Field_Email_Address_Role_Applicant_System_Administrator | Missing_Mandatory_Field_Email_Address_Role_Applicant_System_Administrator_Error |
            | Missing_Mandatory_Field_Country_Role_Team_Manager                         | Missing_Mandatory_Field_Country_Role_Team_Manager_Error                         |
            | Missing_Mandatory_Field_Review_Body_Role_Studywide_Reviewer               | Missing_Mandatory_Field_Review_Body_Role_Studywide_Reviewer_Error               |
            | Missing_Mandatory_Field_Review_Body_Role_Workflow_Coordinator             | Missing_Mandatory_Field_Review_Body_Role_Workflow_Coordinator_Error             |
            | Invalid_Character_Limit                                                   | Invalid_Character_Limit_Error                                                   |
            | Incorrect_Format_Telephone_Data                                           | Incorrect_Format_Field_Telephone_Error                                          |
            | Incorrect_Format_Invalid_Character_Limit_Telephone_Data                   | Incorrect_Format_Invalid_Character_Limit_Telephone_Error                        |
            | Incorrect_Format_Invalid_Character_Limit_Email_Data                       | Incorrect_Format_Invalid_Character_Limit_Email_Address_Error                    |

    @RegressionTestCreateUserErrorMessagesInvalidDataEmails
    Scenario Outline: Validate error messages are displayed for invalid data in the email address field of create user profile page
        Given I have navigated to the 'Create_User_Profile_Page'
        When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
        And I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Create_User_Profile_Page'
        And I capture the page screenshot

        Examples:
            | Invalid_Data_User_Profile                                 | Field_And_Summary_Error_Message            |
            | Invalid_Email_Data_Leading_Dot                            | Incorrect_Format_Field_Email_Address_Error |
            | Invalid_Email_Data_Trailing_Dot                           | Incorrect_Format_Field_Email_Address_Error |
            | Invalid_Email_Data_Double_Dot                             | Incorrect_Format_Field_Email_Address_Error |
            | Invalid_Email_Data_Local_Part_Exceeds_Max_Limit_SixtyFour | Incorrect_Format_Field_Email_Address_Error |
            | Invalid_Email_Data_Reserved_Domain                        | Incorrect_Format_Field_Email_Address_Error |


    @RegressionTestEditCommonUserFields @KNOWN_DEFECT_RSP_7137
    Scenario Outline: Verify the user can edit each of the common user profile fields, with an audit history log
        Given I have navigated to the 'Home_Page'
        And I click the 'System_Administration' link on the 'Home_Page'
        And I can see the system administration home page
        And I click the 'Manage_Users' link on the 'System_Administration_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
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
        When I click the 'User_Profile_Breadcrumb' link on the 'User_Profile_Audit_History_Page'
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
            | Field_Name   | Edit_User                  | Audit_History          |
            | Title        | User_Title_Update          | Edit_User_Title        |
            | First_Name   | User_First_Name_Text_One   | Edit_User_First_Name   |
            | Last_Name    | User_Last_Name_Text_One    | Edit_User_Last_Name    |
            | Telephone    | User_Telephone_Text_One    | Edit_User_Telephone    |
            | Organisation | User_Organisation_Text_One | Edit_User_Organisation |
            | Job_Title    | User_Job_Title_Text_One    | Edit_User_Job_Title    |

    @RegressionTestEditOperationUserFields
    Scenario Outline: Verify the user can edit the fields applicable to a team manager, with an audit history log
        Given I have navigated to the 'Home_Page'
        And I click the 'System_Administration' link on the 'Home_Page'
        And I can see the system administration home page
        And I click the 'Manage_Users' link on the 'System_Administration_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
        And I can see the add a new user profile page
        And I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Team_Manager'
        And I capture the page screenshot
        When I click the 'Continue' button on the 'Create_User_Profile_Page'
        Then I can see the check and create user profile page
        And I capture the page screenshot
        When I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
        Then I can see the create user profile confirmation page for 'Valid_Data_In_All_Fields_Role_Team_Manager'
        And I capture the page screenshot
        When I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
        Then I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        When I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Team_Manager' user with 'ACTIVE' status from the manage user page
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
        Then I can see the audit history page of the selected 'Valid_Data_In_All_Fields_Role_Team_Manager' user
        And I capture the page screenshot
        And I can see the users audit history with the '<Audit_History>' event as the most recent entry

        Examples:
            | Field_Name | Edit_User                 | Audit_History     |
            | Country    | User_Country_Checkbox_One | Edit_User_Country |

    @RegressionTestEditUserProfileBackLinks @KNOWN_DEFECT_RSP_7137
    Scenario: Verify the user can navigate from audit and edit user pages of the user back to system admin page via the 'Back' links
        Given I have navigated to the 'Home_Page'
        And I click the 'System_Administration' link on the 'Home_Page'
        And I can see the system administration home page
        And I click the 'Manage_Users' link on the 'System_Administration_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        And I select a 'QA Automation' User to View and Edit which is 'active'
        And I can see the user profile page
        And I capture the page screenshot
        When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
        Then I can see the audit history page of the user profile
        And I capture the page screenshot
        When I click the 'User_Profile_Breadcrumb' link on the 'User_Profile_Audit_History_Page'
        Then I can see the user profile page
        And I capture the page screenshot
        When I click the change link against 'Title' on the user profile page
        Then I can see the edit user profile page
        And I capture the page screenshot
        When I click the 'Back' link on the 'Edit_User_Profile_Page'
        Then I can see the user profile page
        And I capture the page screenshot
        When I click the 'Manage_Users_Breadcrumb' link on the 'User_Profile_Page'
        Then I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        When I click the 'System_Admin_Breadcrumb' link on the 'Manage_Users_Page'
        Then I can see the 'System_Administration_Page'
        And I capture the page screenshot

    @RegressionTestEditUserErrorMessagesInvalidData @KNOWN_DEFECT_RSP_7137
    Scenario Outline: Validate error messages are displayed for invalid data in edit user profile page
        Given I have navigated to the 'Home_Page'
        And I click the 'System_Administration' link on the 'Home_Page'
        And I can see the system administration home page
        And I click the 'Manage_Users' link on the 'System_Administration_Page'
        And I can see the 'Manage_Users_Page'
        And I capture the page screenshot
        When I enter 'QA Automation' into the search field
        And I click the 'Search' button on the 'Manage_Users_Page'
        And I capture the page screenshot
        And I select a 'QA Automation' User to View and Edit which is '<Status>'
        And I capture the page screenshot
        Then I can see the user profile page
        When I click the '<Edit_User_Field>' change link for '<User_Role>' on the user profile page
        And I capture the page screenshot
        Then I can see the edit user profile page
        And I uncheck the previously selected checkboxes on the edit user profile page for '<Edit_User_Profile>' when the role is selected as study-wide reviewer or team manager or workflow co-ordinator
        And I capture the page screenshot
        And I update user profile with '<Invalid_Data_Edit_User>'
        And I capture the page screenshot
        And I click the 'Save' button on the 'Edit_User_Profile_Page'
        And I capture the page screenshot
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
