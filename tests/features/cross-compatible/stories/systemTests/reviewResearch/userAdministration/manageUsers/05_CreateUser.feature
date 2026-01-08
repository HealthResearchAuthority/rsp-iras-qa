@UserAdministration @ManageUsers @SysAdminUser @SystemTest @CreateUser @STSysAdmin
Feature: Manage Users - Create user

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
    # Then I can see the '<Validation_Text_Manage_Users_List>' ui labels on the manage users list page
    And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
    And I select advanced filters in the manage users page using '<Advanced_Filters_Users>'
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
    And I capture the page screenshot
    And I can see the newly created user record should be present in the list for '<Add_User_Profile>' with '<Status_Enabled>' status in the manage user page
    And I capture the page screenshot
    And I click the 'System_Admin_Breadcrumb' link on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I capture the page screenshot
    Then I can see the 'Manage_Users_Page'
    And I can see the list is sorted by default in the alphabetical order of the 'First Name'
    And I capture the page screenshot

    Examples:
      | Add_User_Profile                                             | Validation_Text_Manage_Users_List | Status_Enabled | Advanced_Filters_Users                                  |
      | Valid_Data_In_All_Fields_Role_System_Administrator           | Label_Texts_Manage_Users_List     | Enabled        | Advanced_Filter_Role_System_Administrator_Status_Active |
      | Valid_Data_In_All_Mandatory_Fields_Role_System_Administrator | Label_Texts_Manage_Users_List     | Enabled        | Advanced_Filter_Role_System_Administrator_Status_Active |
      | Valid_Data_In_All_Fields_Role_Applicant                      | Label_Texts_Manage_Users_List     | Enabled        | Advanced_Filter_Role_Applicant_Status_Active            |
      | Valid_Data_In_All_Mandatory_Fields_Role_Applicant            | Label_Texts_Manage_Users_List     | Enabled        | Advanced_Filter_Role_Applicant_Status_Active            |
      | Valid_Data_In_All_Fields_Role_Team_Manager                   | Label_Texts_Manage_Users_List     | Enabled        | Advanced_Filter_Role_Team_Manager_Status_Active         |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager         | Label_Texts_Manage_Users_List     | Enabled        | Advanced_Filter_Role_Team_Manager_Status_Active         |
      | Valid_Data_In_All_Fields_Role_Studywide_Reviewer             | Label_Texts_Manage_Users_List     | Enabled        | Advanced_Filter_Role_Studywide_Reviewer_Status_Active   |
      | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer   | Label_Texts_Manage_Users_List     | Enabled        | Advanced_Filter_Role_Studywide_Reviewer_Status_Active   |
      | Valid_Data_In_All_Fields_Role_Workflow_Coordinator           | Label_Texts_Manage_Users_List     | Enabled        | Advanced_Filter_Role_Workflow_Coordinator_Status_Active |
      | Valid_Data_In_All_Mandatory_Fields_Role_Workflow_Coordinator | Label_Texts_Manage_Users_List     | Enabled        | Advanced_Filter_Role_Workflow_Coordinator_Status_Active |

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
    And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
    And I select advanced filters in the manage users page using '<Advanced_Filters_Users>'
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
    And I capture the page screenshot
    And I can see the newly created user record should be present in the list for '<Add_Another_User_Profile>' with '<Status_Enabled>' status in the manage user page
    And I capture the page screenshot
    And I click the 'System_Admin_Breadcrumb' link on the 'Manage_Users_Page'
    And I capture the page screenshot
    Then I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I capture the page screenshot
    Then I can see the 'Manage_Users_Page'

    Examples:
      | Add_User_Profile                                             | Add_Another_User_Profile                                             | Status_Enabled | Advanced_Filters_Users                                  |
      | Valid_Data_In_All_Fields_Role_Team_Manager                   | Valid_Data_In_All_Fields_Role_Team_Manager_Another                   | Enabled        | Advanced_Filter_Role_Team_Manager_Status_Active         |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager         | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_Another         | Enabled        | Advanced_Filter_Role_Team_Manager_Status_Active         |
      | Valid_Data_In_All_Fields_Role_System_Administrator           | Valid_Data_In_All_Fields_Role_System_Administrator_Another           | Enabled        | Advanced_Filter_Role_System_Administrator_Status_Active |
      | Valid_Data_In_All_Mandatory_Fields_Role_System_Administrator | Valid_Data_In_All_Mandatory_Fields_Role_System_Administrator_Another | Enabled        | Advanced_Filter_Role_System_Administrator_Status_Active |
      | Valid_Data_In_All_Fields_Role_Applicant                      | Valid_Data_In_All_Fields_Role_Applicant_Another                      | Enabled        | Advanced_Filter_Role_Applicant_Status_Active            |
      | Valid_Data_In_All_Mandatory_Fields_Role_Applicant            | Valid_Data_In_All_Mandatory_Fields_Role_Applicant_Another            | Enabled        | Advanced_Filter_Role_Applicant_Status_Active            |
      | Valid_Data_In_All_Fields_Role_Studywide_Reviewer             | Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Another             | Enabled        | Advanced_Filter_Role_Studywide_Reviewer_Status_Active   |
      | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer   | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer_Another   | Enabled        | Advanced_Filter_Role_Studywide_Reviewer_Status_Active   |
      | Valid_Data_In_All_Fields_Role_Workflow_Coordinator           | Valid_Data_In_All_Fields_Role_Workflow_Coordinator_Another           | Enabled        | Advanced_Filter_Role_Workflow_Coordinator_Status_Active |
      | Valid_Data_In_All_Mandatory_Fields_Role_Workflow_Coordinator | Valid_Data_In_All_Mandatory_Fields_Role_Workflow_Coordinator_Another | Enabled        | Advanced_Filter_Role_Workflow_Coordinator_Status_Active |

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
    When I click the 'Back' button on the 'Check_Create_User_Profile_Page'
    And I capture the page screenshot
    Then I can see the add a new user profile page
    Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the add a new user profile page
    And I capture the page screenshot
    And I uncheck the previously selected checkboxes on the add a new user profile page for '<Add_User_Profile>' for the role is selected as study-wide reviewer or team manager or workflow co-ordinator
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
    And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
    And I select advanced filters in the manage users page using '<Advanced_Filters_Users>'
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
    And I capture the page screenshot
    And I can see the newly created user record should be present in the list for '<Add_Another_User_Profile>' with '<Status_Enabled>' status in the manage user page
    And I capture the page screenshot

    Examples:
      | Add_User_Profile                                             | Add_Another_User_Profile                                             | Status_Enabled | Role_Checkbox                       | Advanced_Filters_Users                                  |
      | Valid_Data_In_All_Fields_Role_Team_Manager                   | Valid_Data_In_All_Fields_Role_Team_Manager_Another                   | Enabled        | Role_TM_SWR_WFC                     | Advanced_Filter_Role_Team_Manager_Status_Active         |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager         | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_Another         | Enabled        | Role_TM_SWR_WFC                     | Advanced_Filter_Role_Team_Manager_Status_Active         |
      | Valid_Data_In_All_Fields_Role_System_Administrator           | Valid_Data_In_All_Fields_Role_System_Administrator_Another           | Enabled        | Role_Applicant_System_Administrator | Advanced_Filter_Role_System_Administrator_Status_Active |
      | Valid_Data_In_All_Mandatory_Fields_Role_System_Administrator | Valid_Data_In_All_Mandatory_Fields_Role_System_Administrator_Another | Enabled        | Role_Applicant_System_Administrator | Advanced_Filter_Role_System_Administrator_Status_Active |
      | Valid_Data_In_All_Fields_Role_Applicant                      | Valid_Data_In_All_Fields_Role_Applicant_Another                      | Enabled        | Role_Applicant_System_Administrator | Advanced_Filter_Role_Applicant_Status_Active            |
      | Valid_Data_In_All_Mandatory_Fields_Role_Applicant            | Valid_Data_In_All_Mandatory_Fields_Role_Applicant_Another            | Enabled        | Role_Applicant_System_Administrator | Advanced_Filter_Role_Applicant_Status_Active            |
      | Valid_Data_In_All_Fields_Role_Studywide_Reviewer             | Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Another             | Enabled        | Role_TM_SWR_WFC                     | Advanced_Filter_Role_Studywide_Reviewer_Status_Active   |
      | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer   | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer_Another   | Enabled        | Role_TM_SWR_WFC                     | Advanced_Filter_Role_Studywide_Reviewer_Status_Active   |
      | Valid_Data_In_All_Fields_Role_Workflow_Coordinator           | Valid_Data_In_All_Fields_Role_Workflow_Coordinator_Another           | Enabled        | Role_TM_SWR_WFC                     | Advanced_Filter_Role_Workflow_Coordinator_Status_Active |
      | Valid_Data_In_All_Mandatory_Fields_Role_Workflow_Coordinator | Valid_Data_In_All_Mandatory_Fields_Role_Workflow_Coordinator_Another | Enabled        | Role_TM_SWR_WFC                     | Advanced_Filter_Role_Workflow_Coordinator_Status_Active |

  @rsp-2827 @rsp-4021 @verifyCheckCreateUserProfileChangeLinkRoleTMSWRWFC @RoleCheckbox
  Scenario Outline: Verify the user can navigate from 'Check and create user profile' page by clicking 'Change' button against all the fields when the role is selected as study-wide reviewer or team manager or workflow co-ordinator
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
    And I uncheck the previously selected checkboxes on the add a new user profile page for '<Add_User_Profile>' for the role is selected as study-wide reviewer or team manager or workflow co-ordinator
    And I clear the previously entered values on the add a new user profile page for '<Add_User_Profile>' for '<Role_Checkbox>'
    And I capture the page screenshot
    When I fill the new user profile page using '<Add_Another_User_Profile>'
    And I capture the page screenshot
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    Then I can see previously filled values in the new user profile page for '<Add_Another_User_Profile>' displayed on the check and create user profile page
    And I capture the page screenshot

    Examples:
      | Add_User_Profile                                                                | Field_Name    | Add_Another_User_Profile                                                                | Role_Checkbox   |
      | Valid_Data_In_All_Fields_Role_Team_Manager                                      | Title         | Valid_Data_In_All_Fields_Role_Team_Manager_Another                                      | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Fields_Role_Team_Manager                                      | First_Name    | Valid_Data_In_All_Fields_Role_Team_Manager_Another                                      | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Fields_Role_Workflow_Coordinator                              | Last_Name     | Valid_Data_In_All_Fields_Role_Workflow_Coordinator_Another                              | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Fields_Role_Workflow_Coordinator                              | Review_Body   | Valid_Data_In_All_Fields_Role_Workflow_Coordinator_Another                              | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Fields_Role_Studywide_Reviewer                                | Email_Address | Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Another                                | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Fields_Role_Studywide_Reviewer                                | Telephone     | Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Another                                | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Fields_Role_Team_Manager_Workflow_Coordinator                 | Country       | Valid_Data_In_All_Fields_Role_Team_Manager_Workflow_Coordinator_Another                 | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Fields_Role_Team_Manager_Workflow_Coordinator                 | Review_Body   | Valid_Data_In_All_Fields_Role_Team_Manager_Workflow_Coordinator_Another                 | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Fields_Role_Team_Manager_Studywide_Reviewer                   | Country       | Valid_Data_In_All_Fields_Role_Team_Manager_Studywide_Reviewer_Another                   | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Fields_Role_Team_Manager_Studywide_Reviewer                   | Review_Body   | Valid_Data_In_All_Fields_Role_Team_Manager_Studywide_Reviewer_Another                   | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Fields_Role_Team_Manager_System_Administrator                 | Country       | Valid_Data_In_All_Fields_Role_Team_Manager_System_Administrator_Another                 | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Fields_Role_Team_Manager_System_Administrator                 | Title         | Valid_Data_In_All_Fields_Role_Team_Manager_System_Administrator_Another                 | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Workflow_Coordinator           | Telephone     | Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Workflow_Coordinator_Another           | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Workflow_Coordinator           | Review_Body   | Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Workflow_Coordinator_Another           | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager                            | Organisation  | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_Another                            | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager                            | Country       | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_Another                            | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer                      | Role          | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer_Another                      | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer                      | Review_Body   | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer_Another                      | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Mandatory_Fields_Role_Workflow_Coordinator                    | Role          | Valid_Data_In_All_Mandatory_Fields_Role_Workflow_Coordinator_Another                    | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Mandatory_Fields_Role_Workflow_Coordinator                    | Review_Body   | Valid_Data_In_All_Mandatory_Fields_Role_Workflow_Coordinator_Another                    | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_Workflow_Coordinator       | Country       | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_Workflow_Coordinator_Another       | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_Workflow_Coordinator       | Review_Body   | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_Workflow_Coordinator_Another       | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_Studywide_Reviewer         | Country       | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_Studywide_Reviewer_Another         | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_Studywide_Reviewer         | Review_Body   | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_Studywide_Reviewer_Another         | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_System_Administrator       | Country       | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_System_Administrator_Another       | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_System_Administrator       | Title         | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_System_Administrator_Another       | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer_Workflow_Coordinator | Telephone     | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer_Workflow_Coordinator_Another | Role_TM_SWR_WFC |
      | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer_Workflow_Coordinator | Review_Body   | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer_Workflow_Coordinator_Another | Role_TM_SWR_WFC |

  @rsp-2827 @verifyCheckCreateUserProfileChangeLinkRoleApplicantSysAdmin @RoleCheckbox
  Scenario Outline: Verify the user can navigate from 'Check and create user profile' page by clicking 'Change' button against all the fields when the role is selected as applicant or system administrator
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
    And I clear the previously entered values on the add a new user profile page for '<Add_User_Profile>' when the role is selected as applicant or system administrator
    And I capture the page screenshot
    When I fill the new user profile page using '<Add_Another_User_Profile>'
    And I capture the page screenshot
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    Then I can see previously filled values in the new user profile page for '<Add_Another_User_Profile>' displayed on the check and create user profile page
    And I capture the page screenshot

    Examples:
      | Add_User_Profile                                             | Field_Name    | Add_Another_User_Profile                                             |
      | Valid_Data_In_All_Fields_Role_System_Administrator           | Title         | Valid_Data_In_All_Fields_Role_System_Administrator_Another           |
      | Valid_Data_In_All_Fields_Role_System_Administrator           | First_Name    | Valid_Data_In_All_Fields_Role_System_Administrator_Another           |
      | Valid_Data_In_All_Fields_Role_System_Administrator           | Last_Name     | Valid_Data_In_All_Fields_Role_System_Administrator_Another           |
      | Valid_Data_In_All_Fields_Role_System_Administrator           | Email_Address | Valid_Data_In_All_Fields_Role_System_Administrator_Another           |
      | Valid_Data_In_All_Mandatory_Fields_Role_System_Administrator | Telephone     | Valid_Data_In_All_Mandatory_Fields_Role_System_Administrator_Another |
      | Valid_Data_In_All_Mandatory_Fields_Role_System_Administrator | Organisation  | Valid_Data_In_All_Mandatory_Fields_Role_System_Administrator_Another |
      | Valid_Data_In_All_Mandatory_Fields_Role_System_Administrator | Job_Title     | Valid_Data_In_All_Mandatory_Fields_Role_System_Administrator_Another |
      | Valid_Data_In_All_Mandatory_Fields_Role_System_Administrator | Role          | Valid_Data_In_All_Mandatory_Fields_Role_System_Administrator_Another |
      | Valid_Data_In_All_Fields_Role_Applicant                      | Title         | Valid_Data_In_All_Fields_Role_System_Administrator_Another           |
      | Valid_Data_In_All_Fields_Role_Applicant                      | First_Name    | Valid_Data_In_All_Fields_Role_System_Administrator_Another           |
      | Valid_Data_In_All_Fields_Role_Applicant                      | Last_Name     | Valid_Data_In_All_Fields_Role_System_Administrator_Another           |
      | Valid_Data_In_All_Fields_Role_Applicant                      | Email_Address | Valid_Data_In_All_Fields_Role_System_Administrator_Another           |
      | Valid_Data_In_All_Mandatory_Fields_Role_Applicant            | Telephone     | Valid_Data_In_All_Mandatory_Fields_Role_Applicant_Another            |
      | Valid_Data_In_All_Mandatory_Fields_Role_Applicant            | Organisation  | Valid_Data_In_All_Mandatory_Fields_Role_Applicant_Another            |
      | Valid_Data_In_All_Mandatory_Fields_Role_Applicant            | Job_Title     | Valid_Data_In_All_Mandatory_Fields_Role_Applicant_Another            |
      | Valid_Data_In_All_Mandatory_Fields_Role_Applicant            | Role          | Valid_Data_In_All_Mandatory_Fields_Role_Applicant_Another            |

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
    When I enter '<Search_Queries>' into the search field for manage users page
    And I capture the page screenshot
    And I click the 'Advanced_Filters' button on the 'Manage_Users_Page'
    And I select advanced filters in the manage users page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_Filters' button on the 'Manage_Users_Page'
    And I capture the page screenshot
    And I search and click on view edit link for unique '<Add_User_Profile>' user with '<Status_Enabled>' status from the manage user page
    When I can see the user profile page
    Then I can see the '<Add_User_Profile>' user has the correct roles assigned on their profile page
    When I click the change link against '<Field_Name>' on the user profile page
    Then I can see that the '<Add_User_Profile>' users data persists on the edit profile page

    Examples:
      | Add_User_Profile                                   | Field_Name | Status_Enabled | Advanced_Filters                                        | Search_Queries            |
      | Valid_Data_In_All_Fields_Role_Team_Manager         | Role       | Enabled        | Advanced_Filter_Role_Team_Manager_Status_Active         | Role_Team_Manager         |
      | Valid_Data_In_All_Fields_Role_System_Administrator | Role       | Enabled        | Advanced_Filter_Role_System_Administrator_Status_Active | Role_System_Administrator |
      | Valid_Data_In_All_Fields_Role_Studywide_Reviewer   | Role       | Enabled        | Advanced_Filter_Role_Studywide_Reviewer_Status_Active   | Role_Studywide_Reviewer   |
      | Valid_Data_In_All_Fields_Role_Workflow_Coordinator | Role       | Enabled        | Advanced_Filter_Role_Workflow_Coordinator_Status_Active | Role_Workflow_Coordinator |
      | Valid_Data_In_All_Fields_Role_Applicant            | Role       | Enabled        | Advanced_Filter_Role_Applicant_Status_Active            | Role_Applicant            |
      | Valid_Data_All_Roles                               | Role       | Enabled        | Advanced_Filter_All_Roles_Status_Active                 | Role_All                  |
      | Valid_Data_No_Roles                                | Role       | Enabled        | Advanced_Filter_No_Roles_Status_Active                  | No_Roles                  |

  @rsp-2827 @VerifyNoErrorMessagesValidEmailData @VerifyNoErrorMessagesValidDataCreateUserPage
  Scenario Outline: Validate user is able to fill the email address field in the create user profile page with valid data
    When I fill the new user profile page using '<Add_User_Profile>'
    And I capture the page screenshot
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the check and create user profile page
    And I capture the page screenshot

    Examples:
      | Add_User_Profile                      |
      | Valid_Email_Data_Dot                  |
      | Valid_Email_Data_Number               |
      | Valid_Email_Data_Underscore           |
      | Valid_Email_Data_Hyphen               |
      | Valid_Email_Data_Plus                 |
      | Valid_Email_Data_Exclamation          |
      | Valid_Email_Data_Hash                 |
      | Valid_Email_Data_Dollar               |
      | Valid_Email_Data_Percentage           |
      | Valid_Email_Data_Ampersand            |
      | Valid_Email_Data_Single_Quote         |
      | Valid_Email_Data_Star                 |
      | Valid_Email_Data_Slash                |
      | Valid_Email_Data_Equal_Symbol         |
      | Valid_Email_Data_Question_Mark        |
      | Valid_Email_Data_Cap_Symbol           |
      | Valid_Email_Data_Curly_Brackets       |
      | Valid_Email_Data_Pipe_Symbol          |
      | Valid_Email_Data_Tilde_Symbol         |
      | Valid_Email_Data_Special_Characters   |
      | Valid_Email_Data_Multiple_Sub_Domains |
      | Valid_Email_Data_Domain               |

  @rsp-3122 @VerifyErrorMessagesInvalidData @VerifyErrorMessagesInvalidDataCreateUserPage @verifyInvalidDataInputs
  Scenario Outline: Validate error messages are displayed for invalid data in create user profile page
    When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I capture the page screenshot
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

  @rsp-3122 @VerifyErrorMessagesInvalidData @VerifyErrorMessagesInvalidDataCreateUserPage @verifyInvalidDataEmails
  Scenario Outline: Validate error messages are displayed for invalid data in the email address field of create user profile page
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

  @rsp-3122 @VerifyErrorMessagesInvalidData @VerifyErrorInvalidDataCreateUserFromCheckCreateUserProfileBackLink
  Scenario Outline: Validation messages are displayed for invalid data entered after the user has navigated back from 'Check and create user profile' page
    When I fill the new user profile page using '<Add_User_Profile>'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    When I click the 'Back' button on the 'Check_Create_User_Profile_Page'
    Then I can see the add a new user profile page
    Then I can see previously filled values in the new user profile page for '<Add_User_Profile>' displayed on the add a new user profile page
    And I capture the page screenshot
    And I uncheck the previously selected checkboxes on the add a new user profile page for '<Add_User_Profile>' for the role is selected as study-wide reviewer or team manager or workflow co-ordinator
    And I clear the previously entered values on the add a new user profile page for '<Add_User_Profile>' for '<Role_Checkbox>'
    And I capture the page screenshot
    When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Create_User_Profile_Page'
    And I capture the page screenshot

    Examples:
      | Add_User_Profile                                   | Role_Checkbox   | Invalid_Data_User_Profile                                   | Field_And_Summary_Error_Message                                   |
      | Valid_Data_In_All_Fields_Role_Team_Manager         | Role_TM_SWR_WFC | Missing_Mandatory_Fields_Role_Team_Manager                  | Missing_Mandatory_Fields_Role_Team_Manager_Error                  |
      | Valid_Data_In_All_Fields_Role_Studywide_Reviewer   | Role_TM_SWR_WFC | Missing_Mandatory_Fields_Role_Studywide_Reviewer            | Missing_Mandatory_Fields_Role_Studywide_Reviewer_Error            |
      | Valid_Data_In_All_Fields_Role_Workflow_Coordinator | Role_TM_SWR_WFC | Missing_Mandatory_Fields_Role_Workflow_Coordinator          | Missing_Mandatory_Fields_Role_Workflow_Coordinator_Error          |
      | Valid_Data_In_All_Fields_Role_Team_Manager         | Role_TM_SWR_WFC | Missing_Mandatory_Field_Country_Role_Team_Manager           | Missing_Mandatory_Field_Country_Role_Team_Manager_Error           |
      | Valid_Data_In_All_Fields_Role_Studywide_Reviewer   | Role_TM_SWR_WFC | Missing_Mandatory_Field_Review_Body_Role_Studywide_Reviewer | Missing_Mandatory_Field_Review_Body_Role_Studywide_Reviewer_Error |

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
    And I uncheck the previously selected checkboxes on the add a new user profile page for '<Add_User_Profile>' for the role is selected as study-wide reviewer or team manager or workflow co-ordinator
    And I clear the previously entered values on the add a new user profile page for '<Add_User_Profile>' for '<Role_Checkbox>'
    And I capture the page screenshot
    When I fill the new user profile page using '<Invalid_Data_User_Profile>' for field validation
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I validate '<Field_And_Summary_Error_Message>' displayed on 'Create_User_Profile_Page'
    And I capture the page screenshot

    Examples:
      | Add_User_Profile                                   | Field_Name  | Role_Checkbox   | Invalid_Data_User_Profile                                   | Field_And_Summary_Error_Message                                   |
      | Valid_Data_In_All_Fields_Role_Team_Manager         | Country     | Role_TM_SWR_WFC | Missing_Mandatory_Fields_Role_Team_Manager                  | Missing_Mandatory_Fields_Role_Team_Manager_Error                  |
      | Valid_Data_In_All_Fields_Role_Studywide_Reviewer   | Review_Body | Role_TM_SWR_WFC | Missing_Mandatory_Fields_Role_Studywide_Reviewer            | Missing_Mandatory_Fields_Role_Studywide_Reviewer_Error            |
      | Valid_Data_In_All_Fields_Role_Workflow_Coordinator | Review_Body | Role_TM_SWR_WFC | Missing_Mandatory_Fields_Role_Workflow_Coordinator          | Missing_Mandatory_Fields_Role_Workflow_Coordinator_Error          |
      | Valid_Data_In_All_Fields_Role_Team_Manager         | First_Name  | Role_TM_SWR_WFC | Missing_Mandatory_Field_Country_Role_Team_Manager           | Missing_Mandatory_Field_Country_Role_Team_Manager_Error           |
      | Valid_Data_In_All_Fields_Role_Studywide_Reviewer   | Last_Name   | Role_TM_SWR_WFC | Missing_Mandatory_Field_Review_Body_Role_Studywide_Reviewer | Missing_Mandatory_Field_Review_Body_Role_Studywide_Reviewer_Error |

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
      | Field_Name    | Position | Invalid_Data_User_Profile                   | Field_And_Summary_Error_Message |
      | Email_Address | First    | Duplicate_Email_Role_Applicant_System_Admin | Duplicate_Email_Error           |
      | Email_Address | Last     | Duplicate_Email_Role_SWR_TM_WFC             | Duplicate_Email_Error           |

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
      | Add_User_Profile                           | Status_Enabled | Invalid_Data_User_Profile       | Field_And_Summary_Error_Message |
      | Valid_Data_In_All_Fields_Role_Team_Manager | Enabled        | Duplicate_Email_Role_SWR_TM_WFC | Duplicate_Email_Error           |

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
    Then I have navigated to the '<Page>' as '<User>'
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
      | Add_User_Profile                                   | Status_Enabled | User                 | User_System_Admin | Page      | Search_Query               |
      | Valid_Data_In_All_Fields_Role_System_Administrator | Enabled        | Applicant_User       | System_Admin      | Home_Page | Applicant_User_Email       |
      | Valid_Data_In_All_Fields_Role_Studywide_Reviewer   | Enabled        | Studywide_Reviewer   | System_Admin      | Home_Page | Studywide_Reviewer_Email   |
      | Valid_Data_In_All_Fields_Role_Team_Manager         | Enabled        | Team_Manager         | System_Admin      | Home_Page | Team_Manager_Email         |
      | Valid_Data_In_All_Fields_Role_Workflow_Coordinator | Enabled        | Workflow_Coordinator | System_Admin      | Home_Page | Workflow_Coordinator_Email |

  @rsp-4390 @ValidateRemovalCommitteeAccessRequired
  Scenario Outline: Validate the removal of committee dropdown and access required checkbox from the 'Add a new user profile' page
    And the '<Option>' should not be available on the add a new user profile page
    And I capture the page screenshot
    Examples:
      | Option                   |
      | Committee_Dropdown       |
      | Access_Required_Checkbox |

  @rsp-4390 @ValidateActiveReviewbodies @jsEnabled
  Scenario Outline: Validate the review body field in the 'Add a new user profile' page incorporates all currently enabled review bodies from the Manage review bodies page when the javascript is enabled
    Then I fill the new user profile page using '<Add_User_Profile>'
    And I capture the page screenshot
    And I retrieve the list of review bodies displayed in the add a new user profile page
    And the '<Option>' should not be available on the add a new user profile page
    And I have navigated to the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I can see the review body field in the add a new user profile page should contain all currently enabled review bodies from the manage review bodies page
    And I capture the page screenshot
    Examples:
      | Add_User_Profile                                             | Advanced_Filters                     | Option           |
      | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer   | Advanced_Filter_All_Countries_Active | Country_Checkbox |
      | Valid_Data_In_All_Mandatory_Fields_Role_Workflow_Coordinator | Advanced_Filter_All_Countries_Active | Country_Checkbox |

  @rsp-4390 @ValidateActiveReviewbodies @jsDisabled
  Scenario Outline: Validate the review body field in the 'Add a new user profile' page incorporates all currently enabled review bodies from the Manage review bodies page when the javascript is disabled
    Then I fill the new user profile page using '<Add_User_Profile>'
    And I capture the page screenshot
    And I retrieve the list of review bodies displayed in the add a new user profile page
    And the '<Option>' should be available on the add a new user profile page
    And I have navigated to the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I click the 'Advanced_Filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I select advanced filters in the manage review bodies page using '<Advanced_Filters>'
    And I capture the page screenshot
    And I click the 'Apply_filters' button on the 'Manage_Review_Bodies_Page'
    And I capture the page screenshot
    And I can see the review body field in the add a new user profile page should contain all currently enabled review bodies from the manage review bodies page
    And I capture the page screenshot
    Examples:
      | Add_User_Profile                                             | Advanced_Filters                     | Option           |
      | Valid_Data_In_All_Mandatory_Fields_Role_Studywide_Reviewer   | Advanced_Filter_All_Countries_Active | Country_Checkbox |
      | Valid_Data_In_All_Mandatory_Fields_Role_Workflow_Coordinator | Advanced_Filter_All_Countries_Active | Country_Checkbox |

  @rsp-4390 @ValidateRole
  Scenario: Validate that the role dropdown on the 'Add a new user profile' page contains the expected roles in alphabetical order
    Then I can see the role dropdown on the add a new user profile page contains the expected roles in alphabetical order
    And I capture the page screenshot

  @rsp-4390 @ValidateActiveCountriesTeamManager @jsEnabled
  Scenario Outline: Validate the display of country field in the 'Add a new user profile' page when the role is selected as team manager and the javascript is enabled
    Then I fill the new user profile page using '<Add_User_Profile>'
    And I capture the page screenshot
    And I can see the country checkbox on the add a new user profile page contains the expected countries in alphabetical order
    And the '<Option_One>' should not be available on the add a new user profile page
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    And I capture the page screenshot
    And the '<Option_One>' change link should be 'unavailable' on the check and create user profile page
    And the '<Option_Two>' change link should be 'available' on the check and create user profile page
    And the '<Option_Three>' change link should be 'unavailable' on the check and create user profile page
    And the '<Option_Four>' change link should be 'unavailable' on the check and create user profile page
    Examples:
      | Add_User_Profile                                     | Option_One           | Option_Two       | Option_Three       | Option_Four              |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager | Review_Body_Checkbox | Country_Checkbox | Committee_Dropdown | Access_Required_Checkbox |


  @rsp-4390 @ValidateActiveCountriesTeamManager @jsDisabled
  Scenario Outline: Validate the display of country field in the 'Add a new user profile' page when the role is selected as team manager and the javascript is disabled
    Then I fill the new user profile page using '<Add_User_Profile>'
    And I capture the page screenshot
    And I can see the country checkbox on the add a new user profile page contains the expected countries in alphabetical order
    And the '<Option_One>' should be available on the add a new user profile page
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    And I capture the page screenshot
    And the '<Option_One>' change link should be 'unavailable' on the check and create user profile page
    And the '<Option_Two>' change link should be 'available' on the check and create user profile page
    And the '<Option_Three>' change link should be 'unavailable' on the check and create user profile page
    And the '<Option_Four>' change link should be 'unavailable' on the check and create user profile page
    Examples:
      | Add_User_Profile                                     | Option_One           | Option_Two       | Option_Three       | Option_Four              |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager | Review_Body_Checkbox | Country_Checkbox | Committee_Dropdown | Access_Required_Checkbox |

  @rsp-4390 @ValidateReviewbodiesCountries @jsEnabled
  Scenario Outline: Validate the display of review body field and country field in the 'Add a new user profile' page when the role is selected as applicant or system admin and the javascript is enabled
    Then I fill the new user profile page using '<Add_User_Profile>'
    And I capture the page screenshot
    And the '<Option_One>' should not be available on the add a new user profile page
    And the '<Option_Two>' should not be available on the add a new user profile page
    And I capture the page screenshot
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    And I capture the page screenshot
    And the '<Option_One>' change link should be 'unavailable' on the check and create user profile page
    And the '<Option_Two>' change link should be 'unavailable' on the check and create user profile page
    And the '<Option_Three>' change link should be 'unavailable' on the check and create user profile page
    And the '<Option_Four>' change link should be 'unavailable' on the check and create user profile page
    Examples:
      | Add_User_Profile                                             | Option_One       | Option_Two           | Option_Three       | Option_Four              |
      | Valid_Data_In_All_Mandatory_Fields_Role_Applicant            | Country_Checkbox | Review_Body_Checkbox | Committee_Dropdown | Access_Required_Checkbox |
      | Valid_Data_In_All_Mandatory_Fields_Role_System_Administrator | Country_Checkbox | Review_Body_Checkbox | Committee_Dropdown | Access_Required_Checkbox |

  @rsp-4390 @ValidateReviewbodiesCountries @jsDisabled
  Scenario Outline: Validate the display of review body field and country field in the 'Add a new user profile' page when the javascript is disabled
    Then I fill the new user profile page using '<Add_User_Profile>'
    And I capture the page screenshot
    And I retrieve the list of review bodies displayed in the add a new user profile page
    And the '<Option_One>' should be available on the add a new user profile page
    And the '<Option_Two>' should be available on the add a new user profile page
    And I capture the page screenshot
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    And I capture the page screenshot
    And the '<Option_One>' change link should be 'unavailable' on the check and create user profile page
    And the '<Option_Two>' change link should be 'unavailable' on the check and create user profile page
    And the '<Option_Three>' change link should be 'unavailable' on the check and create user profile page
    And the '<Option_Four>' change link should be 'unavailable' on the check and create user profile page
    Examples:
      | Add_User_Profile                                             | Option_One       | Option_Two           | Option_Three       | Option_Four              |
      | Valid_Data_In_All_Mandatory_Fields_Role_Applicant            | Country_Checkbox | Review_Body_Checkbox | Committee_Dropdown | Access_Required_Checkbox |
      | Valid_Data_In_All_Mandatory_Fields_Role_System_Administrator | Country_Checkbox | Review_Body_Checkbox | Committee_Dropdown | Access_Required_Checkbox |

  @rsp-4390 @ValidateCountryReviewbodyTeamManagerStudywideReviewer
  Scenario Outline: Validate the display of country and review body in the 'Add a new user profile' page when the role is selected as team manager and study-wide reviewer
    Then I fill the new user profile page using '<Add_User_Profile>'
    And I capture the page screenshot
    And the '<Option_One>' should be available on the add a new user profile page
    And the '<Option_Two>' should be available on the add a new user profile page
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    And I capture the page screenshot
    And the '<Option_One>' change link should be 'available' on the check and create user profile page
    And the '<Option_Two>' change link should be 'available' on the check and create user profile page
    And the '<Option_Three>' change link should be 'unavailable' on the check and create user profile page
    And the '<Option_Four>' change link should be 'unavailable' on the check and create user profile page
    Examples:
      | Add_User_Profile                                                        | Option_One       | Option_Two           | Option_Three       | Option_Four              |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_Studywide_Reviewer | Country_Checkbox | Review_Body_Checkbox | Committee_Dropdown | Access_Required_Checkbox |

  @rsp-4390 @ValidateCountryReviewbodyTeamManagerSystemAdmin @jsEnabled
  Scenario Outline: Validate the display of country in the 'Add a new user profile' page when the role is selected as team manager and system administrator and the javascript is enabled
    Then I fill the new user profile page using '<Add_User_Profile>'
    And I capture the page screenshot
    And the '<Option_One>' should be available on the add a new user profile page
    And the '<Option_Two>' should not be available on the add a new user profile page
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    And I capture the page screenshot
    And the '<Option_One>' change link should be 'available' on the check and create user profile page
    And the '<Option_Two>' change link should be 'unavailable' on the check and create user profile page
    And the '<Option_Three>' change link should be 'unavailable' on the check and create user profile page
    And the '<Option_Four>' change link should be 'unavailable' on the check and create user profile page
    Examples:
      | Add_User_Profile                                                          | Option_One       | Option_Two           | Option_Three       | Option_Four              |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_System_Administrator | Country_Checkbox | Review_Body_Checkbox | Committee_Dropdown | Access_Required_Checkbox |

  @rsp-4390 @ValidateCountryReviewbodyTeamManagerSystemAdmin @jsDisabled
  Scenario Outline: Validate the display of country in the 'Add a new user profile' page when the role is selected as team manager and system administrator and the javascript is disabled
    Then I fill the new user profile page using '<Add_User_Profile>'
    And I capture the page screenshot
    And the '<Option_One>' should be available on the add a new user profile page
    And the '<Option_Two>' should be available on the add a new user profile page
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    And I capture the page screenshot
    And the '<Option_One>' change link should be 'available' on the check and create user profile page
    And the '<Option_Two>' change link should be 'unavailable' on the check and create user profile page
    And the '<Option_Three>' change link should be 'unavailable' on the check and create user profile page
    And the '<Option_Four>' change link should be 'unavailable' on the check and create user profile page
    Examples:
      | Add_User_Profile                                                          | Option_One       | Option_Two           | Option_Three       | Option_Four              |
      | Valid_Data_In_All_Mandatory_Fields_Role_Team_Manager_System_Administrator | Country_Checkbox | Review_Body_Checkbox | Committee_Dropdown | Access_Required_Checkbox |


