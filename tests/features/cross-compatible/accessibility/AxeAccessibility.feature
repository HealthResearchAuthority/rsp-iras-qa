@axeAccessibility @jsEnabled
Feature: Run Axe Accessibilty Test Tool Against App Pages

  @axeAccessibilityHome @SysAdminUser
  Scenario: My account home Page of system administrator
    Given I have navigated to the 'Home_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilitymyResearchProjectsPage @ApplicantUser
  Scenario: My Research Home Page and Project Overview
    Given I have navigated to the 'Home_Page'
    When I click the 'My_research' link on the 'Home_Page'
    Then I can see the 'My_Research_Page'
    And I click the 'Project' link on the 'My_Research_Page'
    When I click the 'Project_Team' link on the 'Project_Overview_Page'
    Then I click the 'Research_Locations' link on the 'Project_Overview_Page'
    And I can see the project overview page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCreateProjectRecord @ApplicantUser
  Scenario: Create a project record
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjectDetailsIRAS @ApplicantUser
  Scenario: Project Details IRAS ID
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjectDetailsTitle @ApplicantUser
  Scenario: Project Details - Short project title and Planned end date
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project details title page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityChiefInvestigator @ApplicantUser
  Scenario: Chief investigator
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I can see the chief investigator page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjectIdentifier @ApplicantUser
  Scenario: Project Identifiers
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I can see the project identifiers page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityResearchLocations @ApplicantUser
  Scenario: Research Locations
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I can see the research locations page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjectOverviewCreateProject @ApplicantUser
  Scenario: Project Overview -Create project
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Save_Continue' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    Then I can see the project overview page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjectOverviewModifications @ApplicantUser
  Scenario: Project Overview - Modifications
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Participating_Organisation_Option' from area of change dropdown and 'Addition_Of_Sites_Option' from specific change dropdown
    When I click the 'Save_For_Later' button on the 'Select_Area_Of_Change_Page'
    Then I can see the project overview page
    Then I can see the participating organisation page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewYourAnswers @ApplicantUser
  Scenario: Review your answers
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityKeyProjectRolesSponsorOrganisation @ApplicantUser
  Scenario: Chief investigator - Primary Sponsor Organisation Suggestion List
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I can see the chief investigator page
    And I fill the chief investigator page with 'Sponsor_Organisation_Partial_Text_NHS'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilitySystemAdministrationPage @SysAdminUser
  Scenario: System administration home page
    Given I have navigated to the 'Home_Page'
    When I click the 'System_administration' link on the 'Home_Page'
    Then I can see the 'System_Administration_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityManageUsersList @SysAdminUser @axeAccessibilityManageUsers
  Scenario: Manage Users list page
    Given I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Users_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityAddNewUserProfile @SysAdminUser @axeAccessibilityManageUsers
  Scenario: Add a new user profile record page
    Given I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Users_Page'
    When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    Then I can see the add a new user profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCheckCreateUserProfile @SysAdminUser @axeAccessibilityManageUsers
  Scenario: Check and create user profile page
    Given I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Users_Page'
    When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    Then I can see the add a new user profile page
    When I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Workflow_Coordinator'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCreateUserConfirmation @SysAdminUser @axeAccessibilityManageUsers
  Scenario: Create user profile confirmation page
    Given I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Users_Page'
    When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    Then I can see the add a new user profile page
    When I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Workflow_Coordinator'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    Then I can see the create user profile confirmation page for 'Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Workflow_Coordinator'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityViewUserProfile @SysAdminUser @axeAccessibilityManageUsers
  Scenario: View user profile page
    Given I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Users_Page'
    When I click the 'View_Edit' link on the 'Manage_Users_Page'
    Then I can see the user profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityEditUserProfile @SysAdminUser @axeAccessibilityManageUsers
  Scenario: Edit user profile page
    Given I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Users_Page'
    When I click the 'View_Edit' link on the 'Manage_Users_Page'
    Then I can see the user profile page
    When I click the change link against 'First_Name' on the user profile page
    Then I can see the edit user profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityUserProfileDisable @SysAdminUser @axeAccessibilityManageUsers
  Scenario: View user profile page with disable button available
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Workflow_Coordinator'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Workflow_Coordinator' user with 'Enabled' status from the manage user page
    And I can see the user profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityUserProfileDisableConfirmation @SysAdminUser @axeAccessibilityManageUsers
  Scenario: View disable confirmation page for user roles
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Workflow_Coordinator'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Workflow_Coordinator' user with 'Enabled' status from the manage user page
    And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
    And I can see a 'Confirm' button on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityUserProfileDisableSuccess @SysAdminUser @axeAccessibilityManageUsers
  Scenario: View disable confirmation success page for user roles
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Workflow_Coordinator'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Studywide_Reviewer_Workflow_Coordinator' user with 'Enabled' status from the manage user page
    And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I can see a 'Back_To_Manage_Users' link on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityUserProfileEnable @SysAdminUser @axeAccessibilityManageUsers
  Scenario: View user profile page with enable button available
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Team_Manager_System_Administrator'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Team_Manager_System_Administrator' user with 'Enabled' status from the manage user page
    And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Team_Manager_System_Administrator' user with 'Disabled' status from the manage user page
    And I can see the user profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityUserProfileEnableConfirmation @SysAdminUser @axeAccessibilityManageUsers
  Scenario: View enable confirmation page for user roles
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Team_Manager_System_Administrator'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Team_Manager_System_Administrator' user with 'Enabled' status from the manage user page
    And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Team_Manager_System_Administrator' user with 'Disabled' status from the manage user page
    And I click the 'Enable_User_Record' button on the 'User_Profile_Page'
    And I can see a 'Confirm' button on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityUserProfileEnableSuccess @SysAdminUser @axeAccessibilityManageUsers
  Scenario: View enable confirmation success page for user roles
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Team_Manager_System_Administrator'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Team_Manager_System_Administrator' user with 'Enabled' status from the manage user page
    And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Team_Manager_System_Administrator' user with 'Disabled' status from the manage user page
    And I click the 'Enable_User_Record' button on the 'User_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I can see a 'Back_To_Manage_Users' link on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityAuditHistoryUser @SysAdminUser @axeAccessibilityManageUsers
  Scenario: Audit history page of the user
    Given I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Users_Page'
    And I select a 'QA Automation' User to View and Edit which is 'Enabled'
    And I can see the user profile page
    When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
    Then I can see the audit history page of the user profile
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityManageReviewBodiesList @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: Manage review bodies list page
    Given I have navigated to the 'Manage_Review_Bodies_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityAddReviewBodies @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: Add a new review body page
    Given I have navigated to the 'Manage_Review_Bodies_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
    Then I can see the 'Create_Review_Body_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCheckReviewBodies @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: Check and create review body page
    Given I have navigated to the 'Manage_Review_Bodies_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
    Then I can see the 'Create_Review_Body_Page'
    When I fill the new review body page using 'Valid_Data_In_All_Fields'
    And I click the 'Continue' button on the 'Create_Review_Body_Page'
    Then I can see the check and create review body page for 'Valid_Data_In_All_Fields'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityConfirmReviewBodies @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: Create review body confirmation page
    Given I have navigated to the 'Manage_Review_Bodies_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
    Then I can see the 'Create_Review_Body_Page'
    When I fill the new review body page using 'Valid_Data_In_All_Fields'
    And I click the 'Continue' button on the 'Create_Review_Body_Page'
    Then I can see the check and create review body page for 'Valid_Data_In_All_Fields'
    And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
    Then I can see the create Review body confirmation page for 'Valid_Data_In_All_Fields'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodiesProfile @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: Review body profile page
    Given I have navigated to the 'Manage_Review_Bodies_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I select a 'QA Automation' review Body to View and Edit which is 'Enabled'
    And I can see the review body profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityEditReviewBodies @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario Outline: Edit review body page
    Given I have navigated to the 'Manage_Review_Bodies_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I select a 'QA Automation' review Body to View and Edit which is 'Enabled'
    And I can see the review body profile page
    And I click the change link against 'Organisation_Name' on the review body profile page
    And I can see the edit review body page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyDisable @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: View review body page with disable button available
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
    And I fill the new review body page using 'Valid_Data_In_All_Fields'
    And I click the 'Continue' button on the 'Create_Review_Body_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I enter 'name of the new review body' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I can see the 'newly created review body' should be present in the list with 'Enabled' status in the manage review bodies page
    Then I click the view edit link
    Then I can see the 'Disable_Label_Texts' ui labels on the 'manage review body' profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyDisableConfirmation @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: View disable confirmation page for review body
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
    And I fill the new review body page using 'Valid_Data_In_All_Fields'
    And I click the 'Continue' button on the 'Create_Review_Body_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I enter 'name of the new review body' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I can see the 'newly created review body' should be present in the list with 'Enabled' status in the manage review bodies page
    Then I click the view edit link
    And I click the 'Disable_User_Record' button on the 'Review_Body_Profile_Page'
    And I can see a 'Confirm' button on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyDisableSuccess @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: View disable confirmation success page for review body
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
    And I fill the new review body page using 'Valid_Data_In_All_Fields'
    And I click the 'Continue' button on the 'Create_Review_Body_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I enter 'name of the new review body' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I can see the 'newly created review body' should be present in the list with 'Enabled' status in the manage review bodies page
    Then I click the view edit link
    And I click the 'Disable_User_Record' button on the 'Review_Body_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I can see a 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyEnable @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: View review body page with enable button available
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
    And I fill the new review body page using 'Valid_Data_In_All_Fields'
    And I click the 'Continue' button on the 'Create_Review_Body_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I enter 'name of the new review body' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I can see the 'newly created review body' should be present in the list with 'Enabled' status in the manage review bodies page
    Then I click the view edit link
    And I click the 'Disable_User_Record' button on the 'Review_Body_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I enter 'name of the new review body' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I can see the 'newly created review body' should be present in the list with 'Disabled' status in the manage review bodies page
    Then I click the view edit link
    And I can see the 'Enable_Label_Texts' ui labels on the 'manage review body' profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyEnableConfirmation @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: View enable confirmation page for review body
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
    And I fill the new review body page using 'Valid_Data_In_All_Fields'
    And I click the 'Continue' button on the 'Create_Review_Body_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I enter 'name of the new review body' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I can see the 'newly created review body' should be present in the list with 'Enabled' status in the manage review bodies page
    Then I click the view edit link
    And I click the 'Disable_User_Record' button on the 'Review_Body_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I enter 'name of the new review body' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I can see the 'newly created review body' should be present in the list with 'Disabled' status in the manage review bodies page
    Then I click the view edit link
    And I click the 'Enable_User_Record' button on the 'Review_Body_Profile_Page'
    And I can see a 'Confirm' button on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyEnableSuccess @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: View enable confirmation success page for review body
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
    And I fill the new review body page using 'Valid_Data_In_All_Fields'
    And I click the 'Continue' button on the 'Create_Review_Body_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_Review_Body_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I enter 'name of the new review body' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I can see the 'newly created review body' should be present in the list with 'Enabled' status in the manage review bodies page
    Then I click the view edit link
    And I click the 'Disable_User_Record' button on the 'Review_Body_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I enter 'name of the new review body' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I can see the 'newly created review body' should be present in the list with 'Disabled' status in the manage review bodies page
    Then I click the view edit link
    And I click the 'Enable_User_Record' button on the 'Review_Body_Profile_Page'
    When I click the 'Confirm' button on the 'Confirmation_Page'
    And I can see a 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityAuditHistoryReviewBody @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: Audit history page of the review body
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I click the 'View_Edit' link on the 'Manage_Review_Bodies_Page'
    And I can see the review body profile page
    And I click the 'View_This_Review_Body_Audit_History' link on the 'Review_Body_Profile_Page'
    Then I can see the audit history page of the review body
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyUserList @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: View user list page of the review body
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I click the 'View_Edit' link on the 'Manage_Review_Bodies_Page'
    And I can see the review body profile page
    And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
    Then I can see the user list page of the 'review body'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyUserListSearchResultsFound @axeAccessibilityReviewBodyUserList @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: View user list page of the review body when search results found
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I select a 'QA Automation' review Body to View and Edit which is 'Enabled'
    And I can see the review body profile page
    And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
    Then I can see the user list page of the 'review body'
    And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
    And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
    And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
    And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
    Then I can see the user list page of the 'review body'
    And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
    And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
    And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
    And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
    Then I can see the user list page of the 'review body'
    When I enter the 'Email_Address' of the 'last' user shown on the current 'review body' users list, into the search field
    And I click the 'Search' button on the 'Review_Body_User_List_Page'
    Then the system displays search results matching the search criteria
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyUserListCheckRemoveUserProfile @axeAccessibilityReviewBodyUserList @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: View check and remove user profile page
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I select a 'QA Automation' review Body to View and Edit which is 'Enabled'
    And I can see the review body profile page
    And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
    Then I can see the user list page of the 'review body'
    And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
    And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
    And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
    And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
    Then I can see the user list page of the 'review body'
    And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
    And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
    And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
    And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
    Then I can see the user list page of the 'review body'
    When I enter the 'Email_Address' of the 'last' user shown on the current 'review body' users list, into the search field
    And I click the 'Search' button on the 'Review_Body_User_List_Page'
    Then the system displays search results matching the search criteria
    When I click the 'Remove' link on the 'Review_Body_User_List_Page'
    Then I can see the check and remove user profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyUserListCheckRemoveUserConfirmation @axeAccessibilityReviewBodyUserList @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: View remove user confirmation page
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I select a 'QA Automation' review Body to View and Edit which is 'Enabled'
    And I can see the review body profile page
    And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
    Then I can see the user list page of the 'review body'
    And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
    And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
    And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
    And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
    Then I can see the user list page of the 'review body'
    And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
    And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
    And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
    And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
    Then I can see the user list page of the 'review body'
    When I enter the 'Email_Address' of the 'last' user shown on the current 'review body' users list, into the search field
    And I click the 'Search' button on the 'Review_Body_User_List_Page'
    Then the system displays search results matching the search criteria
    When I click the 'Remove' link on the 'Review_Body_User_List_Page'
    Then I can see the check and remove user profile page
    And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
    And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyUserListSearchNoResultsFound @axeAccessibilityReviewBodyUserList @SysAdminUser @axeAccessibilityManageReviewBodies
  Scenario: View user list page of the review body when search results not found
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I select a 'QA Automation' review Body to View and Edit which is 'Enabled'
    And I can see the review body profile page
    And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
    Then I can see the user list page of the 'review body'
    And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
    And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
    And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
    And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
    Then I can see the user list page of the 'review body'
    And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
    And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
    And I click the 'Add_Another_User_To_The_Review_Body' link on the 'Confirmation_Page'
    And I click the 'Back' link on the 'Search_Add_User_Review_Body_Page'
    Then I can see the user list page of the 'review body'
    When I enter the 'Email_Address' of the 'last' user shown on the current 'review body' users list, into the search field
    And I click the 'Search' button on the 'Review_Body_User_List_Page'
    Then the system displays search results matching the search criteria
    When I click the 'Remove' link on the 'Review_Body_User_List_Page'
    Then I can see the check and remove user profile page
    And I click the 'Remove_User_Profile' button on the 'Check_Remove_User_Profile_Page'
    And I validate 'Remove_User_From_Review_Body_Labels' labels displayed in the success confirmation page when the user removed from the review body
    And I click the 'Remove_Another_User_From_The_Review_Body' link on the 'Confirmation_Page'
    Then I can see the user list page of the 'review body'
    And I enter an input into the search field to search for the removed user of the review body
    And I click the 'Search' button on the 'Review_Body_User_List_Page'
    Then the system displays no results found message in the user list page of the review body
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilitySearchAddUserReviewBodyResults @SysAdminUser
  Scenario: Search add user to review body page with results
    Given I have navigated to the 'Manage_Review_Bodies_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I select a 'QA Automation' review Body to View and Edit which is 'Enabled'
    And I can see the review body profile page
    And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
    And I can see the user list page of the 'review body'
    And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
    And I can see the search for user to add to review body page
    And I fill the search input for searching 'adding users' with 'Existing_QA_User_First_Name' as the search query
    And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
    And I can see that the add users to 'review body' search page contains 'Results'
    And the add users to 'review body' search has returned results with the 'Existing_QA_User_First_Name'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilitySearchAddUserReviewBodyNoResults @SysAdminUser
  Scenario: Search add user to review body page with no results found
    Given I have navigated to the 'Manage_Review_Bodies_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I select a 'QA Automation' review Body to View and Edit which is 'Enabled'
    And I can see the review body profile page
    And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
    And I can see the user list page of the 'review body'
    And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
    And I can see the search for user to add to review body page
    And I fill the search input for searching 'adding users' with 'Non_Existant_User_Data' as the search query
    And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
    And I can see that the add users to 'review body' search page contains 'No_Results'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCheckAddUserReviewBody @SysAdminUser
  Scenario: Check add user to review body page
    Given I have navigated to the 'Manage_Review_Bodies_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I select a 'QA Automation' review Body to View and Edit which is 'Enabled'
    And I can see the review body profile page
    And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
    And I can see the user list page of the 'review body'
    And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
    And I can see the search for user to add to review body page
    And I fill the search input for searching 'adding users' with 'Existing_QA_User_First_Name' as the search query
    And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
    And I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
    And I can see the check and add user to review body page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityAddUserReviewBodyConfirmation @SysAdminUser
  Scenario: Add user to review body confirmation page
    Given I have navigated to the 'Manage_Review_Bodies_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Manage_Review_Bodies_Page'
    And I select a 'QA Automation' review Body to View and Edit which is 'Enabled'
    And I can see the review body profile page
    And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
    And I can see the user list page of the 'review body'
    And I click the 'Add_User_To_This_Review_Body' link on the 'Review_Body_User_List_Page'
    And I can see the search for user to add to review body page
    And I fill the search input for searching 'adding users' with 'Existing_QA_User_First_Name' as the search query
    And I click the 'Search' button on the 'Search_Add_User_Review_Body_Page'
    And I click the 'Add_User' link on the 'Search_Add_User_Review_Body_Page'
    And I can see the check and add user to review body page
    And I click the 'Add_User' button on the 'Check_Add_User_Review_Body_Page'
    And I am on the confirmation screen
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilitySearchModificationsPage @StudyWideReviewer
  Scenario: Search modifications page
    Given I have navigated to the 'Search_Modifications_Page'
    And I fill the search input for searching 'modifications' with 'Valid_Iras_Id_Prefix' as the search query
    And I click the 'Search' button on the 'Search_Modifications_Page'
    And I can now see a table of search results for modifications received for approval
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityAdvanceFilterSearchModifications @StudyWideReviewer
  Scenario: Search modifications page with active filters
    Given I have navigated to the 'Search_Modifications_Page'
    Then I can see the 'Search_Modifications_Page'
    When I enter 'Valid_Iras_Id_Nth' into the search field
    And I select advanced filters in the search modifications page using 'Advanced_Filters_Nth'
    And I click the 'Apply_filters' button on the 'Search_Modifications_Page'
    Then 'I can see the selected filters are displayed under' active filters 'Advanced_Filters_Nth' in the 'Search_Modifications_Page'
    And the system displays modification records based on the search 'Valid_Iras_Id_Nth' and filter criteria 'Advanced_Filters_Nth'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityModificationsTasklistPage @WorkFlowCoordinator
  Scenario: Modifications tasklist page
    Given I have navigated to the 'Modifications_Tasklist_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityModficationsTasklistPageWithFilters @WorkFlowCoordinator
  Scenario: Modifications tasklist page with active filters
    Given I have navigated to the 'Modifications_Tasklist_Page'
    And I click the 'Advanced_Filters' button on the 'Modifications_Tasklist_Page'
    And I 'can' see the advanced filters panel
    And I open each of the modification tasklist filters
    When I fill the 'assign' modifications tasklist search and filter options with 'Title_Date_Range_Single'
    And I click the 'Apply_Filters' button on the 'Modifications_Tasklist_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilitMyModficationsTasklistPage @StudyWideReviewer
  Scenario: My Modifications tasklist page
    Given I have navigated to the 'My_Modifications_Tasklist_Page'
    And I click the 'Advanced_Filters' button on the 'My_Modifications_Tasklist_Page'
    And I 'can' see the advanced filters panel
    And I open each of the modification tasklist filters
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityMyModficationsTasklistPageWithFilters @StudyWideReviewer
  Scenario: My Modifications tasklist page with active filters
    Given I have navigated to the 'My_Modifications_Tasklist_Page'
    And I click the 'Advanced_Filters' button on the 'My_Modifications_Tasklist_Page'
    And I 'can' see the advanced filters panel
    And I open each of the modification tasklist filters
    When I fill the 'my' modifications tasklist search and filter options with 'Title_Date_Range_Single'
    And I click the 'Apply_Filters' button on the 'My_Modifications_Tasklist_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityModificationsTasklistPage @WorkFlowCoordinator
  Scenario: Select Studywide Reviewer Page
    Given I have navigated to the 'Modifications_Tasklist_Page'
    When I enter 'Valid_Iras_Id_Ln_England_Pn_England' into the search field in the modifications ready to assign page
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    When I select modifications with ids as 'Modification_Id_Ln_England_Pn_England_Five_Six' by clicking the checkbox in the modifications ready to assign page
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityModificationsTasklistPage @WorkFlowCoordinator
  Scenario: Modifications assignment confirmation page
    Given I have navigated to the 'Modifications_Tasklist_Page'
    When I enter 'Valid_Iras_Id_Ln_England_Pn_England' into the search field in the modifications ready to assign page
    And I click the 'Search' button on the 'Modifications_Tasklist_Page'
    When I select modifications with ids as 'Modification_Id_Ln_England_Pn_England_One' by clicking the checkbox in the modifications ready to assign page
    And I click the 'Continue_to_assign_modifications' button on the 'Modifications_Tasklist_Page'
    Then I can see the 'Select_Study_Wide_Reviewer_Page'
    And I select a study wide reviewer in the select a reviewer page using 'Study_Wide_Reviewer_HRA_England'
    And I click the 'Complete_Assignment' button on the 'Select_Study_Wide_Reviewer_Page'
    Then I can see the modifications assignment confirmation page for 'Study_Wide_Reviewer_HRA_England'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilitySelectAreaOfChange @ApplicantUser
  Scenario: Modifications select area of change
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    Then I can see the select area of change page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityParticipatingOrganisation @ApplicantUser
  Scenario: Modifications search participating organisations
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Participating_Organisation' from area of change dropdown and 'Addition_Of_Sites_Option' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the participating organisation page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityPlannedEndDateModifications @ApplicantUser
  Scenario: Modifications Planned End Date Page
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Project_Design' from area of change dropdown and 'Planned_End_Date' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the 'Planned_End_Date' page for modifications
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityWhichOrganisationChangeAffectModifications @ApplicantUser
  Scenario: Modifications Which organisation change affect page
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Project_Design' from area of change dropdown and 'Planned_End_Date' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the 'Planned_End_Date' page for modifications
    Then I fill the planned project end date modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    Then I can see the 'Affected_Organisation_Selection_Page' page for modifications
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityAffectedOrganisationNhsHscQuestionsPage @ApplicantUser
  Scenario: Modifications affected organisations nhs hsc questions page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Project_Design' from area of change dropdown and 'Planned_End_Date' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I fill the planned project end date modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    Then I can see the 'Affected_Organisation_Selection_Page' page for modifications
    And I fill the which organisation this change affect modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Affected_Organisation_Selection_Page'
    Then I can see the change planned end date affected organisation questions page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityAffectedOrganisationNonNhsHscQuestionsPage @ApplicantUser
  Scenario: Modifications affected organisations non nhs hsc questions page
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Project_Design' from area of change dropdown and 'Planned_End_Date' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I fill the planned project end date modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    Then I can see the 'Affected_Organisation_Selection_Page' page for modifications
    And I fill the which organisation this change affect modifications page with 'Non_NHS_HSC_Only'
    When I click the 'Save_Continue' button on the 'Affected_Organisation_Selection_Page'
    Then I can see the change planned end date affected organisation questions page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityModificationReviewChangesPage @ApplicantUser
  Scenario: Modification review changes page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Project_Design' from area of change dropdown and 'Planned_End_Date' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I fill the planned project end date modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    Then I can see the 'Affected_Organisation_Selection_Page' page for modifications
    And I fill the which organisation this change affect modifications page with 'NHS_HSC_Only'
    When I click the 'Save_Continue' button on the 'Affected_Organisation_Selection_Page'
    Then I can see the change planned end date affected organisation questions page
    And I fill the affected organisation questions page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Affected_Organisation_Questions_Page'
    And I can see the modification review changes page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjectOverviewPostApprovalPage @ApplicantUser
  Scenario: Project overview post approvals page
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjectOverviewPostApprovalPageSpecificProject @ApplicantUser
  Scenario: Project overview post approvals page for a specific project
    When I navigate to the project overview page of the 'Test_Project' project
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjectOverviewProjectDocumentsSpecificProject @ApplicantUser
  Scenario: Project overview project documents page for a specific project
    When I navigate to the project overview page of the 'Test_Project' project
    When I click the 'Project_Documents' link on the 'Project_Overview_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjectDocumentsAddDocumentModificationsPage @ApplicantUser
  Scenario: Modifications add document page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    Then I can see the review your answers page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Documents' from area of change dropdown and 'Correction_Of_Typographical_Errors' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the add documents for 'Correction_Of_Typographical_Errors' page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjectDocumentsReviewDocumentModificationsPage @ApplicantUser
  Scenario: Modifications project documents review page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    Then I can see the review your answers page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Documents' from area of change dropdown and 'Correction_Of_Typographical_Errors' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I upload 'PNG_File' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for 'Correction_Of_Typographical_Errors' page
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I can see the add document details for 'Correction_Of_Typographical_Errors' page
    And I click on the document link with status 'Document_Status_Incomplete' and enter 'Valid_Data_Fields' for the uploaded 'PNG_File' in the add document details for specific document page
    When I click the 'Save_Continue' button on the 'Add_Document_Details_For_Specific_Document_Modifications_Page'
    When I click the 'Save_Continue' button on the 'Add_Document_Details_Modifications_Page'
    And I can see the review your document information page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityAddDocumentDetailsForSpecificDocumentPage @ApplicantUser
  Scenario: Add document details for specific document page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Documents' from area of change dropdown and 'Correction_Of_Typographical_Errors' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I upload 'PNG_File' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for 'Correction_Of_Typographical_Errors' page
    When I click the 'Save_Continue' button on the 'Review_Uploaded_Document_Modifications_Page'
    When I can see the add document details for 'Correction_Of_Typographical_Errors' page
    And I click on the document link with status 'Document_Status_Incomplete' and I can see the add document details for specific document page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjectConfirmationPage @ApplicantUser
  Scenario: Create Project confirmation page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the chief investigator page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    And I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewAllChangesPage @StudyWideReviewer
  Scenario: Review all changes page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I create 'Multiple_Changes_Planned_End_Date' for the created modification
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityModificationSentToSponsorConfirmationPage @ApplicantUser
  Scenario: Modification sent to sponsor confirmation page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    Then I can see the review your answers page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I create 'Multiple_Changes_Planned_End_Date' for the created modification
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I can see the add sponsor reference page
    Then I fill the sponsor reference modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue_Review' button on the 'Sponsor_Reference_Page'
    Then I can see the review all changes modifications page
    Then I click the 'Send_Modification_To_Sponsor' button on the 'Review_All_Changes_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityModificationDetailsPage @ApplicantUser
  Scenario: Create modification - modification details page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the review your answers page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I can see the select area of change page
    And I select 'Project_Design' from area of change dropdown and 'Planned_End_Date' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I fill the planned project end date modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    Then I can see the 'Affected_Organisation_Selection_Page' page for modifications
    And I fill the which organisation this change affect modifications page with 'NHS_HSC_Only'
    When I click the 'Save_Continue' button on the 'Affected_Organisation_Selection_Page'
    Then I can see the change planned end date affected organisation questions page
    And I fill the affected organisation questions page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Affected_Organisation_Questions_Page'
    When I click the 'Save_Continue' button on the 'Review_Changes_Planned_End_Date_Page'
    And I can see the modifications details page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjectOverviewUnfinishedPojectsPage @ApplicantUser
  Scenario: Project overview unfinished projects -Create project
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    Then I can see the project overview for unfinished projects page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @DeleteProjectRecordConfirmationPage @ApplicantUser
  Scenario: Delete project record confirmation page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    And I click the 'Delete_Project' button on the 'Project_Overview_Unfinished_Projects_Page'
    And I can see the delete project confirmation page based on 'Valid_Data_All_Fields' entered for short project title
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProfileSettingsPage @ApplicantUser
  Scenario: Profile settings page
    Given I have navigated to the 'Profile_Settings_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityEditYourProfilePage @ApplicantUser
  Scenario: Edit your profile page
    Given I have navigated to the 'Edit_Your_Profile_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCompleteYourProfilePage @ApplicantUser
  Scenario: Complete your profile page
    Given I have navigated to the 'Login_Page' as 'One_Login_Account_User'
    When I login to the application as the 'One_Login_Account_User'
    Then I can see the 'Complete_Your_Profile_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCheckYourProfilePage @ApplicantUser
  Scenario: Check your profile page
    Given I have navigated to the 'Login_Page' as 'One_Login_Account_User'
    When I login to the application as the 'One_Login_Account_User'
    Then I can see the 'Complete_Your_Profile_Page'
    When I fill the complete profile page with 'One_Login_Account_User' details
    And I click the 'Save_Continue' button on the 'Complete_Your_Profile_Page'
    Then I can see the 'Check_Your_Profile_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityModificationsEnterFreeTextPage @ApplicantUser
  Scenario: Modifications - Enter free text page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

    Examples:
      | Changes                                                                   | Area_Of_Change         | Specific_Change                              | Project_Details_Title |
      | Bulk_Free_Text_Single_Change_Other_Minor_Change_To_Participant_Procedures | Participant_Procedures | Other_Minor_Change_To_Participant_Procedures | Valid_Data_All_Fields |

  @axeAccessibilitySelectReferenceSelectChange @ApplicantUser
  Scenario Outline: Modifications - Select change page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the project identification select change modification page
    And I capture the page screenshot
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

    Examples:
      | Changes                                           | Area_Of_Change                         | Specific_Change        | Project_Details_Title |
      | Modification_To_Add_Administrative_Details_Single | Administrative_Details_For_The_Project | Project_Identification | Valid_Data_All_Fields |

  @axeAccessibilitySelectReference @ApplicantUser
  Scenario Outline: Modifications - Select reference page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I fill the project identification select change modification page using '<Changes>' dataset
    When I click the 'Save_Continue' button on the 'Project_Identification_Select_Change_Page'
    Then I can see the project identification enter reference modification page
    And I capture the page screenshot
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

    Examples:
      | Changes                                                  | Area_Of_Change                         | Specific_Change        | Project_Details_Title |
      | Modification_To_Add_Administrative_Details_Single_Change | Administrative_Details_For_The_Project | Project_Identification | Valid_Data_All_Fields |

  @axeAccessibilityEnterReferenceNumber @ApplicantUser
  Scenario Outline: Modifications - Enter reference number page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I fill the project identification select change modification page using '<Changes>' dataset
    When I click the 'Save_Continue' button on the 'Project_Identification_Select_Change_Page'
    And I fill the project identification select reference modification page using '<Changes>' dataset
    When I click the 'Save_Continue' button on the 'Project_Identification_SelectReference_To_Change_Page'
    Then I can see the project identification enter reference modification page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

    Examples:
      | Changes                                                  | Area_Of_Change                         | Specific_Change        | Project_Details_Title |
      | Modification_To_Add_Administrative_Details_Single_Change | Administrative_Details_For_The_Project | Project_Identification | Valid_Data_All_Fields |

  @axeAccessibilitySponsorReferenceModificationsPage @ApplicantUser
  Scenario: Sponsor reference modification page
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Design' from area of change dropdown and 'Planned_End_Date' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I fill the planned project end date modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    And I fill the which organisation this change affect modifications page with 'NHS_HSC_Only'
    When I click the 'Save_Continue' button on the 'Affected_Organisation_Selection_Page'
    And I fill the affected organisation questions page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Affected_Organisation_Questions_Page'
    When I click the 'Save_Continue' button on the 'Review_Changes_Planned_End_Date_Page'
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I can see the add sponsor reference page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityDeleteModificationConfirmationPage @ApplicantUser
  Scenario: Delete modification confirmation page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I create 'Multiple_Changes_Planned_End_Date' for the created modification
    And I click the 'Delete_Modification' link on the 'Modification_Details_Page'
    And I validate all field values on delete modification confirmation screen
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityDeleteOneUploadedDocument @ApplicantUser
  Scenario: Delete one uploaded document confirmation page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Documents' from area of change dropdown and 'Correction_Of_Typographical_Errors' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I upload 'PNG_File' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Add_Another_Document' button on the 'Review_Uploaded_Document_Modifications_Page'
    Then I upload 'GIF_File' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for 'Correction_Of_Typographical_Errors' page
    And I click the 'Delete' link on the 'Add_Documents_Details_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityDeleteAllUploadedDocuments @ApplicantUser
  Scenario: Delete all documents confirmation page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Documents' from area of change dropdown and 'Correction_Of_Typographical_Errors' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I upload 'PNG_File' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Add_Another_Document' button on the 'Review_Uploaded_Document_Modifications_Page'
    Then I upload 'GIF_File' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    And I click the 'Delete_All' link on the 'Documents_Added_For_Change_Page'
    Then I can see the delete multiple documents confirmation page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityModificationsEnterFreeTextPage @ApplicantUser
  Scenario: Modifications - Enter free text page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

    Examples:
      | Changes                                                                   | Area_Of_Change         | Specific_Change                              | Project_Details_Title |
      | Bulk_Free_Text_Single_Change_Other_Minor_Change_To_Participant_Procedures | Participant_Procedures | Other_Minor_Change_To_Participant_Procedures | Valid_Data_All_Fields |

  @axeAccessibilitySelectReferenceSelectChange @ApplicantUser
  Scenario Outline: Modifications - Select change page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I can see the project identification select change modification page
    And I capture the page screenshot
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

    Examples:
      | Changes                                           | Area_Of_Change                         | Specific_Change        | Project_Details_Title |
      | Modification_To_Add_Administrative_Details_Single | Administrative_Details_For_The_Project | Project_Identification | Valid_Data_All_Fields |

  @axeAccessibilitySelectReference @ApplicantUser
  Scenario Outline: Modifications - Select reference page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I fill the project identification select change modification page using '<Changes>' dataset
    When I click the 'Save_Continue' button on the 'Project_Identification_Select_Change_Page'
    Then I can see the project identification enter reference modification page
    And I capture the page screenshot
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

    Examples:
      | Changes                                                  | Area_Of_Change                         | Specific_Change        | Project_Details_Title |
      | Modification_To_Add_Administrative_Details_Single_Change | Administrative_Details_For_The_Project | Project_Identification | Valid_Data_All_Fields |

  @axeAccessibilityEnterReferenceNumber @ApplicantUser
  Scenario Outline: Modifications - Enter reference number page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select '<Area_Of_Change>' from area of change dropdown and '<Specific_Change>' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I fill the project identification select change modification page using '<Changes>' dataset
    When I click the 'Save_Continue' button on the 'Project_Identification_Select_Change_Page'
    And I fill the project identification select reference modification page using '<Changes>' dataset
    When I click the 'Save_Continue' button on the 'Project_Identification_SelectReference_To_Change_Page'
    Then I can see the project identification enter reference modification page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

    Examples:
      | Changes                                                  | Area_Of_Change                         | Specific_Change        | Project_Details_Title |
      | Modification_To_Add_Administrative_Details_Single_Change | Administrative_Details_For_The_Project | Project_Identification | Valid_Data_All_Fields |

  @axeAccessibilitySponsorReferenceModificationsPage @ApplicantUser
  Scenario: Sponsor reference modification page
    Given I have navigated to the my research projects page
    And I can see the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Design' from area of change dropdown and 'Planned_End_Date' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I fill the planned project end date modifications page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Modifications_Page'
    And I fill the which organisation this change affect modifications page with 'NHS_HSC_Only'
    When I click the 'Save_Continue' button on the 'Affected_Organisation_Selection_Page'
    And I fill the affected organisation questions page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Affected_Organisation_Questions_Page'
    When I click the 'Save_Continue' button on the 'Review_Changes_Planned_End_Date_Page'
    When I click the 'Save_Continue_Review' button on the 'Modification_Details_Page'
    Then I can see the add sponsor reference page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityDeleteModificationConfirmationPage @ApplicantUser
  Scenario: Delete modification confirmation page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I create 'Multiple_Changes_Planned_End_Date' for the created modification
    And I click the 'Delete_Modification' link on the 'Modification_Details_Page'
    And I validate all field values on delete modification confirmation screen
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityDeleteOneUploadedDocument @ApplicantUser
  Scenario: Delete one uploaded document confirmation page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Documents' from area of change dropdown and 'Correction_Of_Typographical_Errors' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I upload 'PNG_File' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Add_Another_Document' button on the 'Review_Uploaded_Document_Modifications_Page'
    Then I upload 'GIF_File' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    Then I can see the review uploaded documents for 'Correction_Of_Typographical_Errors' page
    And I click the 'Delete' link on the 'Add_Documents_Details_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityDeleteAllUploadedDocuments @ApplicantUser
  Scenario: Delete all documents confirmation page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    And I click the 'Add_Project' button on the 'Confirm_Project_Details_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    And I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    When I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Documents' from area of change dropdown and 'Correction_Of_Typographical_Errors' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    Then I upload 'PNG_File' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    When I click the 'Add_Another_Document' button on the 'Review_Uploaded_Document_Modifications_Page'
    Then I upload 'GIF_File' documents
    When I click the 'Save_Continue' button on the 'Add_Document_Modifications_Page'
    And I click the 'Delete_All' link on the 'Documents_Added_For_Change_Page'
    Then I can see the delete multiple documents confirmation page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProfileSettingsPage @ApplicantUser
  Scenario: Profile settings page
    Given I have navigated to the 'Profile_Settings_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityEditYourProfilePage @ApplicantUser
  Scenario: Edit your profile page
    Given I have navigated to the 'Edit_Your_Profile_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCompleteYourProfilePage @ApplicantUser
  Scenario: Complete your profile page
    Given I have navigated to the 'Login_Page' as 'One_Login_Account_User'
    When I login to the application as the 'One_Login_Account_User'
    Then I can see the 'Complete_Your_Profile_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCheckYourProfilePage @ApplicantUser
  Scenario: Check your profile page
    Given I have navigated to the 'Login_Page' as 'One_Login_Account_User'
    When I login to the application as the 'One_Login_Account_User'
    Then I can see the 'Complete_Your_Profile_Page'
    When I fill the complete profile page with 'One_Login_Account_User' details
    And I click the 'Save_Continue' button on the 'Complete_Your_Profile_Page'
    Then I can see the 'Check_Your_Profile_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityManageSponsorOrgPage @SysAdminUser
  Scenario: Manage sponsor organisation page
    Given I have navigated to the 'Home_Page'
    When I click the 'System_Administration' link on the 'Home_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilitySetupNewSponsorOrgPage @SysAdminUser
  Scenario: Set up a new sponsor organisation page
    Given I have navigated to the 'Home_Page'
    When I click the 'System_Administration' link on the 'Home_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    Then I can see the 'Setup_New_Sponsor_Organisation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCheckSetupSponsorOrgPage @SysAdminUser
  Scenario: Check setup sponsor organisation page
    Given I have navigated to the 'Home_Page'
    When I click the 'System_Administration' link on the 'Home_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    And I click the 'Setup_New_Sponsor_Organisation' link on the 'Manage_Sponsor_Organisations_Page'
    Then I can see the 'Setup_New_Sponsor_Organisation_Page'
    When I select a sponsor organisation in the set up a new sponsor organisation page using 'BUCKINGHAMSHIRE HEALTHCARE NHS TRUST'
    And I capture the page screenshot
    And I click the 'Save_Continue' button on the 'Setup_New_Sponsor_Organisation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilitySponsorOrgProfilePage @SysAdminUser
  Scenario: Sponsor organisation profile page
    Given I have navigated to the 'Home_Page'
    When I click the 'System_Administration' link on the 'Home_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    When I enter the 'Organisation_Name' of the 'First' item in the list, into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'previously added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I can see the sponsor organisation profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityDisableSponsorOrgConfirmationPage @SysAdminUser
  Scenario: Disable confirmation page of the sponsor organisation profile page
    Given I have navigated to the 'Home_Page'
    When I click the 'System_Administration' link on the 'Home_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    When I enter the 'Organisation_Name' of the 'First' item in the list, into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'previously added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I can see the sponsor organisation profile page
    When I click the 'Disable' button on the 'Sponsor_Organisation_Profile_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilitySponsorOrgProfilePage @SysAdminUser
  Scenario: Enable confirmation page of the sponsor organisation profile page
    Given I have navigated to the 'Home_Page'
    When I click the 'System_Administration' link on the 'Home_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    When I enter the 'Organisation_Name' of the 'First' item in the list, into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'previously added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I can see the sponsor organisation profile page
    When I click the 'Disable' button on the 'Sponsor_Organisation_Profile_Page'
    When I click the 'Confirm' button on the 'Confirmation_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    When I enter the 'Organisation_Name' of the 'First' item in the list, into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'previously added sponsor organisation' should be present in the list with 'Disabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I can see the sponsor organisation profile page
    When I click the 'Enable' button on the 'Sponsor_Organisation_Profile_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations
    When I click the 'Confirm' button on the 'Confirmation_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'

  @axeAccessibilityUserlistSponsorOrgProfilePage @SysAdminUser
  Scenario: User list page of the sponsor organisation profile page
    Given I have navigated to the 'Home_Page'
    When I click the 'System_Administration' link on the 'Home_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    When I enter the 'Organisation_Name' of the 'First' item in the list, into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'previously added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I can see the sponsor organisation profile page
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    Then I can see the user list page of the 'sponsor organisation'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilitySearchAddUserFromUserlistSponsorOrgProfilePage @SysAdminUser
  Scenario: Search and add a new user page from the user list page of the sponsor organisation profile page
    Given I have navigated to the 'Home_Page'
    When I click the 'System_Administration' link on the 'Home_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    When I enter the 'Organisation_Name' of the 'First' item in the list, into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'previously added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I can see the sponsor organisation profile page
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    Then I can see the user list page of the 'sponsor organisation'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCheckAddUserToSponsorOrgPage @SysAdminUser
  Scenario: Check and add user to sponsor organisation page
    Given I have navigated to the 'Home_Page'
    When I click the 'System_Administration' link on the 'Home_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    When I enter the 'Organisation_Name' of the 'First' item in the list, into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'previously added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I can see the sponsor organisation profile page
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    Then I can see the user list page of the 'sponsor organisation'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityViewEditUserProfilePageofSponsorOrg @SysAdminUser
  Scenario: View and edit user profile page of the sponsor organisation
    Given I have navigated to the 'Home_Page'
    When I click the 'System_Administration' link on the 'Home_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    When I enter the 'Organisation_Name' of the 'First' item in the list, into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'previously added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I can see the sponsor organisation profile page
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    Then I can see the user list page of the 'sponsor organisation'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    Then I can see the 'Search_Add_User_Sponsor_Org_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    Then I can see the 'Check_Add_User_Sponsor_Org_Page'
    And the check and add user to sponsor organisation page displays the expected user details
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    Then I can see the user list page of the 'sponsor organisation'
    When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
    And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
    When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
    Then I can see the 'View_Edit_User_Profile_Page'
    And I can see the view and edit user profile page of the sponsor organisation
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityDisableUserConfirmationPageofSponsorOrg @SysAdminUser
  Scenario: Disable user confirmation page of the sponsor organisation
    Given I have navigated to the 'Home_Page'
    When I click the 'System_Administration' link on the 'Home_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    When I enter the 'Organisation_Name' of the 'First' item in the list, into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'previously added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I can see the sponsor organisation profile page
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    Then I can see the user list page of the 'sponsor organisation'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    Then I can see the 'Search_Add_User_Sponsor_Org_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    Then I can see the 'Check_Add_User_Sponsor_Org_Page'
    And the check and add user to sponsor organisation page displays the expected user details
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    Then I can see the user list page of the 'sponsor organisation'
    When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
    And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
    When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
    Then I can see the 'View_Edit_User_Profile_Page'
    And I can see the view and edit user profile page of the sponsor organisation
    When I click the 'Disable_User' button on the 'View_Edit_User_Profile_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityyEnableUserConfirmationPageofSponsorOrg @SysAdminUser
  Scenario: Enable user confirmation page of the sponsor organisation
    Given I have navigated to the 'Home_Page'
    When I click the 'System_Administration' link on the 'Home_Page'
    And I click the 'Manage_Sponsor_Organisations' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Sponsor_Organisations_Page'
    When I enter the 'Organisation_Name' of the 'First' item in the list, into the search field
    And I click the 'Search' button on the 'Manage_Sponsor_Organisations_Page'
    Then the system displays 'sponsor organisations' matching the search criteria
    And I can see the 'previously added sponsor organisation' should be present in the list with 'Enabled' status in the manage sponsor organisation page
    Then I click the view edit link of the 'previously added sponsor organisation'
    And I can see the sponsor organisation profile page
    And I click the 'View_This_Sponsor_Org_List_Of_Users' link on the 'Sponsor_Organisation_Profile_Page'
    Then I can see the user list page of the 'sponsor organisation'
    And I click the 'Add_A_New_User_Profile_Record' link on the 'Sponsor_Org_User_List_Page'
    Then I can see the 'Search_Add_User_Sponsor_Org_Page'
    When I enter 'QA Automation' into the search field
    And I click the 'Search' button on the 'Search_Add_User_Sponsor_Org_Page'
    When I click the 'Add_User' link on the 'Search_Add_User_Sponsor_Org_Page'
    Then I can see the 'Check_Add_User_Sponsor_Org_Page'
    And the check and add user to sponsor organisation page displays the expected user details
    And I click the 'Add_User' button on the 'Check_Add_User_Sponsor_Org_Page'
    Then I can see the 'user added' successful message on sponsor organisation user list page
    Then I can see the user list page of the 'sponsor organisation'
    When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
    And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
    When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
    Then I can see the 'View_Edit_User_Profile_Page'
    And I can see the view and edit user profile page of the sponsor organisation
    When I click the 'Disable_User' button on the 'View_Edit_User_Profile_Page'
    When I click the 'Confirm' button on the 'Confirmation_Page'
    Then I can see the 'user in the selected sponsor organisation disabled' successful message on sponsor organisation user list page
    Then I can see the 'Sponsor_Org_User_List_Page'
    Then I can see the user list page of the 'sponsor organisation'
    When I enter 'email of the newly added user in the selected sponsor organisation' into the search field
    And I click the 'Search' button on the 'Sponsor_Org_User_List_Page'
    When I click the 'View_Edit' link on the 'Sponsor_Org_User_List_Page'
    Then I can see the 'View_Edit_User_Profile_Page'
    When I click the 'Enable_User' button on the 'View_Edit_User_Profile_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations
    When I click the 'Confirm' button on the 'Confirmation_Page'
    Then I can see the 'user in the selected sponsor organisation enabled' successful message on sponsor organisation user list page
    Then I can see the 'Sponsor_Org_User_List_Page'

  @axeAccessibilitymyResearchPage @ApplicantUser
  Scenario: My Research search and advanced filters page
    Given I have navigated to the 'Home_Page'
    When I click the 'My_research' link on the 'Home_Page'
    Then I can see the 'My_Research_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityModificationsContactDetailsPage @ApplicantUser
  Scenario: Modifications - Contact details page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Administrative_Details_Project' from area of change dropdown and 'Contact_Details' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Contact_Details_Select_Change_Page' page for modifications
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityModificationsProjectPersonnelChangeChiefInvestigatorPage @ApplicantUser
  Scenario: Modifications - Project Personnel Change Chief Investigator page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Personnel' from area of change dropdown and 'Change_Of_Chief_Investigator' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Project_Personnel_Select_Change_Page' page for modifications
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityModificationsProjectPersonnelChangePrincipalInvestigatorPage @ApplicantUser
  Scenario: Modifications - Project Personnel Change Principal Investigator page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    When I click the 'Post_Approval' link on the 'Project_Overview_Page'
    And I click the 'Create_New_Modification' button on the 'Project_Overview_Page'
    And I select 'Project_Personnel' from area of change dropdown and 'Change_Of_Principal_Investigator' from specific change dropdown
    When I click the 'Save_Continue' button on the 'Select_Area_Of_Change_Page'
    And I can see the 'Project_Personnel_Principal_Investigator_Select_Change_Page' page for modifications
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @ApplicantUser @IRASIDNotInHARPInvalidErrorPage
  Scenario Outline: IRAS ID not eligible to use the service error page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with 'IRAS_ID_Not_In_HARP'
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @ApplicantUser @IRASIDAlreadyExistInvalidPage
  Scenario: IRAS ID already exists in service error page
    Given I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    When I click the 'Home' link on the 'Banner'
    When I have navigated to the my research projects page
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    And I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the existing iras id in project details iras page
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations
