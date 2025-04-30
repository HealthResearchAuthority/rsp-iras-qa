@axeAccessibility @jsEnabled
Feature: Run Axe Accessibilty Test Tool Against App Pages

  @axeAccessibilityHome @adminUser
  Scenario: Home Page
    Given I have navigated to the 'Home_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityIdg
  Scenario: IDG Login Page
    Given I have navigated to the 'Login_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCreate @adminUser
  Scenario: Create Application Page
    Given I have navigated to the 'Create_Application_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjFilter @adminUser
  Scenario: Project Filter Question Set
    Given I have navigated to the 'Home_Page'
    And I click the 'Make_Changes_To_Research' button on the 'Home_Page'
    And I can see the 'Create_Application_Page'
    And I enter the application name and description for 'Project_X'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for 'Project_X'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCreateProjectRecord @adminUser
  Scenario: Create a project record
    Given I have navigated to the 'Home_Page'
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjectDetailsIRAS @adminUser
  Scenario: Project Details IRAS ID
    Given I have navigated to the 'Home_Page'
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    Then I can see the project details iras page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjectDetailsTitle @adminUser
  Scenario: Project Details - Short project title and Planned end date
    Given I have navigated to the 'Home_Page'
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with 'Valid_IRAS_ID_Max'
    When I click the 'Save_Continue' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityKeyProjectRoles @adminUser
  Scenario: Key Project Roles
    Given I have navigated to the 'Home_Page'
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with 'Valid_IRAS_ID_Max'
    When I click the 'Save_Continue' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I can see the key project roles page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityResearchLocations @adminUser
  Scenario: Research Locations
    Given I have navigated to the 'Home_Page'
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the project details iras page with 'Valid_IRAS_ID_Max'
    When I click the 'Save_Continue' button on the 'Project_Details_IRAS_Page'
    And I fill the project details title page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    And I fill the key project roles page with 'Valid_Data_All_Fields'
    When I click the 'Save_Continue' button on the 'Key_Project_Roles_Page'
    Then I can see the research locations page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityProjectOverviewSaveLater @adminUser
  Scenario: Project Overview - Save for later page
    Given I have navigated to the 'Home_Page'
    And I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I fill the unique iras id in project details iras page
    And I click the 'Save_Continue' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    And I fill the project details title page with '<Project_Details_Title>'
    When I click the 'Save_For_Later' button on the 'Project_Details_Title_Page'
    Then I can see the project overview save for later page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityManageUsersList @adminUser @axeAccessibilityManageUsers
  Scenario: Manage Users list page
    Given I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Users_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityAddNewUserProfile @adminUser @axeAccessibilityManageUsers
  Scenario: Add a new user profile record page
    Given I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Users_Page'
    When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    Then I can see the add a new user profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCheckCreateUserProfile @adminUser @axeAccessibilityManageUsers
  Scenario: Check and create user profile page
    Given I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Users_Page'
    When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    Then I can see the add a new user profile page
    When I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Operations'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCreateUserConfirmation @adminUser @axeAccessibilityManageUsers
  Scenario: Create user profile confirmation page
    Given I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Users_Page'
    When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    Then I can see the add a new user profile page
    When I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Operations'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    Then I can see the check and create user profile page
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    Then I can see the create user profile confirmation page for 'Valid_Data_In_All_Fields_Role_Operations'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityViewUserProfile @adminUser @axeAccessibilityManageUsers
  Scenario: View user profile page
    Given I have navigated to the 'System_Administration_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Users_Page'
    When I click the 'View_Edit' link on the 'Manage_Users_Page'
    Then I can see the user profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityEditUserProfile @adminUser @axeAccessibilityManageUsers
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

  @axeAccessibilityUserProfileDisable @adminUser @axeAccessibilityManageUsers
  Scenario: View user profile page with disable button available
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Operations'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Operations' user with 'ACTIVE' status from the manage user page
    And I can see the user profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityUserProfileDisableConfirmation @adminUser @axeAccessibilityManageUsers
  Scenario: View disable confirmation page for user roles
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Operations'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Operations' user with 'ACTIVE' status from the manage user page
    And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
    And I can see a 'Confirm' button on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityUserProfileDisableSuccess @adminUser @axeAccessibilityManageUsers
  Scenario: View disable confirmation success page for user roles
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Operations'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Operations' user with 'ACTIVE' status from the manage user page
    And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I can see a 'Back_To_Manage_Users' link on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityUserProfileEnable @adminUser @axeAccessibilityManageUsers
  Scenario: View user profile page with enable button available
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Operations'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Operations' user with 'ACTIVE' status from the manage user page
    And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Operations' user with 'DISABLED' status from the manage user page
    And I can see the user profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityUserProfileEnableConfirmation @adminUser @axeAccessibilityManageUsers
  Scenario: View enable confirmation page for user roles
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Operations'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Operations' user with 'ACTIVE' status from the manage user page
    And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Operations' user with 'DISABLED' status from the manage user page
    And I click the 'Enable_User_Record' button on the 'User_Profile_Page'
    And I can see a 'Confirm' button on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityUserProfileEnableSuccess @adminUser @axeAccessibilityManageUsers
  Scenario: View enable confirmation success page for user roles
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Users' link on the 'System_Administration_Page'
    And I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    And I fill the new user profile page using 'Valid_Data_In_All_Fields_Role_Operations'
    And I click the 'Continue' button on the 'Create_User_Profile_Page'
    And I click the 'Create_Profile' button on the 'Check_Create_User_Profile_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Create_User_Profile_Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Operations' user with 'ACTIVE' status from the manage user page
    And I click the 'Disable_User_Record' button on the 'User_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Users' link on the 'Confirmation_Page'
    And I can see the 'Manage_Users_Page'
    And I search and click on view edit link for unique 'Valid_Data_In_All_Fields_Role_Operations' user with 'DISABLED' status from the manage user page
    And I click the 'Enable_User_Record' button on the 'User_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I can see a 'Back_To_Manage_Users' link on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilitySystemAdministrationPage @adminUser
  Scenario: System administration home page
    Given I have navigated to the 'System_Administration_Page'
    Then I can see the 'System_Administration_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityManageReviewBodiesList @adminUser @axeAccessibilityManageReviewBodies
  Scenario: Manage review bodies list page
    Given I have navigated to the 'Manage_Review_Bodies_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityAddReviewBodies @adminUser @axeAccessibilityManageReviewBodies
  Scenario: Add a new review body page
    Given I have navigated to the 'Manage_Review_Bodies_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page'
    Then I can see the 'Create_Review_Body_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCheckReviewBodies @adminUser @axeAccessibilityManageReviewBodies
  Scenario Outline: Check and create review body page
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


  @axeAccessibilityConfirmReviewBodies @adminUser @axeAccessibilityManageReviewBodies
  Scenario Outline: Create review body confirmation page
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

  @axeAccessibilityReviewBodiesProfile @adminUser @axeAccessibilityManageReviewBodies
  Scenario Outline: Review body profile page
    Given I have navigated to the 'Manage_Review_Bodies_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I select a 'QA Automation' Review Body to View and Edit which is 'active'
    And I can see the review body profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityEditReviewBodies @adminUser @axeAccessibilityManageReviewBodies
  Scenario Outline: Edit review body page
    Given I have navigated to the 'Manage_Review_Bodies_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I select a 'QA Automation' Review Body to View and Edit which is 'active'
    And I can see the review body profile page
    And I click the change link against 'Organisation_Name' on the review body profile page
    And I can see the edit review body page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyDisable @adminUser @axeAccessibilityManageReviewBodies
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
    And I click the view edit link for the newly created review body
    Then I can see the 'Disable_Label_Texts' ui labels on the manage review body profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyDisableConfirmation @adminUser @axeAccessibilityManageReviewBodies
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
    And I click the view edit link for the newly created review body
    And I click the 'Disable_User_Record' button on the 'Review_Body_Profile_Page'
    And I can see a 'Confirm' button on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyDisableSuccess @adminUser @axeAccessibilityManageReviewBodies
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
    And I click the view edit link for the newly created review body
    And I click the 'Disable_User_Record' button on the 'Review_Body_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I can see a 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyEnable @adminUser @axeAccessibilityManageReviewBodies
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
    And I click the view edit link for the newly created review body
    And I click the 'Disable_User_Record' button on the 'Review_Body_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I can see the status of the review body is 'disabled'
    And I click the view edit link for the newly created review body
    And I can see the 'Enable_Label_Texts' ui labels on the manage review body profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyEnableConfirmation @adminUser @axeAccessibilityManageReviewBodies
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
    And I click the view edit link for the newly created review body
    And I click the 'Disable_User_Record' button on the 'Review_Body_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I can see the status of the review body is 'disabled'
    And I click the view edit link for the newly created review body
    And I click the 'Enable_User_Record' button on the 'Review_Body_Profile_Page'
    And I can see a 'Confirm' button on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityReviewBodyEnableSuccess @adminUser @axeAccessibilityManageReviewBodies
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
    And I click the view edit link for the newly created review body
    And I click the 'Disable_User_Record' button on the 'Review_Body_Profile_Page'
    And I click the 'Confirm' button on the 'Confirmation_Page'
    And I click the 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    And I can see the status of the review body is 'disabled'
    And I click the view edit link for the newly created review body
    And I click the 'Enable_User_Record' button on the 'Review_Body_Profile_Page'
    When I click the 'Confirm' button on the 'Confirmation_Page'
    And I can see a 'Back_To_Manage_Review_Bodies' link on the 'Confirmation_Page'
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityAuditHistoryReviewBody @adminUser @axeAccessibilityManageReviewBodies
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

  @axeAccessibilityAuditHistoryUser @adminUser @axeAccessibilityManageUsers
  Scenario: Audit history page of the user
    Given I have navigated to the 'Home_Page'
    And I click the 'Manage_Users' link on the 'Banner'
    And I can see the 'Manage_Users_Page'
    And I select a 'QA Automation' User to View and Edit which is 'active'
    And I can see the user profile page
    When I click the 'View_Users_Audit_History' link on the 'User_Profile_Page'
    Then I can see the audit history page of the user profile
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityUserListReviewBody @adminUser @axeAccessibilityManageReviewBodies
  Scenario: User list page of the review body
    Given I have navigated to the 'System_Administration_Page'
    And I click the 'Manage_Review_Bodies' link on the 'System_Administration_Page'
    Then I can see the 'Manage_Review_Bodies_Page'
    When I click the 'View_Edit' link on the 'Manage_Review_Bodies_Page'
    And I can see the review body profile page
    And I click the 'View_This_Review_Body_List_Of_Users' link on the 'Review_Body_Profile_Page'
    Then I can see the user list page of the review body
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations