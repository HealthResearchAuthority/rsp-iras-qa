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

  @axeAccessibilityManageUsersList @adminUser @axeAccessibilityManageUsers
  Scenario: Manage Users list page
    Given I have navigated to the 'System_Administration_Home_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Home_Page'
    Then I can see the manage users list page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityAddNewUserProfile @adminUser @axeAccessibilityManageUsers
  Scenario: Add a new user profile record page
    Given I have navigated to the 'System_Administration_Home_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Home_Page'
    Then I can see the manage users list page
    When I click the 'Add_New_User_Profile_Record' link on the 'Manage_Users_Page'
    Then I can see the add a new user profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityCheckCreateUserProfile @adminUser @axeAccessibilityManageUsers
  Scenario: Check and create user profile page
    Given I have navigated to the 'System_Administration_Home_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Home_Page'
    Then I can see the manage users list page
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
    Given I have navigated to the 'System_Administration_Home_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Home_Page'
    Then I can see the manage users list page
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
    Given I have navigated to the 'System_Administration_Home_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Home_Page'
    Then I can see the manage users list page
    When I click the 'View_Edit' link on the 'Manage_Users_Page'
    Then I can see the user profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations

  @axeAccessibilityEditUserProfile @adminUser @axeAccessibilityManageUsers
  Scenario: Edit user profile page
    Given I have navigated to the 'System_Administration_Home_Page'
    When I click the 'Manage_Users' link on the 'System_Administration_Home_Page'
    Then I can see the manage users list page
    When I click the 'View_Edit' link on the 'Manage_Users_Page'
    Then I can see the user profile page
    When I click the 'Change' link on the 'User_Profile_Page'
    Then I can see the edit user profile page
    When I Scan the page with the Axe Accessibilty Tool
    And I analyse the results from the Axe scan
    Then I expect to receive no WCAG Violations  

    # @axeAccessibilityManageReviewBodies @adminUser
    # Scenario: Manage Review Bodies list page
    #     Given I have navigated to the 'Home_Page'
    #     When I click the 'Manage_Review_Bodies' link on the 'Home_Page' #done        
    #     Then I can see the Manage review bodies list page #done
    #     When I Scan the page with the Axe Accessibilty Tool
    #     And I analyse the results from the Axe scan
    #     Then I expect to receive no WCAG Violations

    # @axeAccessibilityManageReviewBodies @adminUser
    # Scenario: Add a new review body page
    #     Given I have navigated to the 'Home_Page'
    #     When I click the 'Manage_Review_Bodies' link on the 'Home_Page' #done        
    #     Then I can see the Manage review bodies list page #done
    #     When I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page' #done        
    #     Then I can see the Add a new review body page #done
    #     When I Scan the page with the Axe Accessibilty Tool
    #     And I analyse the results from the Axe scan
    #     Then I expect to receive no WCAG Violations

    # @axeAccessibilityManageReviewBodies @adminUser
    # Scenario Outline: Check and create review body page        
    #     Given I have navigated to the 'Home_Page'
    #     When I click the 'Manage_Review_Bodies' link on the 'Home_Page' #done        
    #     Then I can see the Manage review bodies list page #done
    #     When I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page' #done        
    #     Then I can see the Add a new review body page #done     
    #     When I fill the new review body page using '<Add_Review_Body>'  #done
    #     And I click the 'Complete' button on the 'Add_New_Review_Body_Page' #done       
    #     Then I can see the Check and create review body page for '<Add_Review_Body>' #done
    #     When I Scan the page with the Axe Accessibilty Tool
    #     And I analyse the results from the Axe scan
    #     Then I expect to receive no WCAG Violations   

    #     Examples:
    #     | Add_Review_Body                      |
    #     | Valid_Data_In_All_Fields             | 
    #     | Valid_Data_In_All_Mandatory_Fields   | 

    # @axeAccessibilityManageReviewBodies @adminUser
    # Scenario Outline: Create Review body confirmation page        
    #     Given I have navigated to the 'Home_Page'
    #     When I click the 'Manage_Review_Bodies' link on the 'Home_Page' #done        
    #     Then I can see the Manage review bodies list page #done
    #     When I click the 'Add_New_Review_Body_Record' link on the 'Manage_Review_Bodies_Page' #done        
    #     Then I can see the Add a new review body page #done     
    #     When I fill the new review body page using '<Add_Review_Body>'  #done
    #     And I click the 'Complete' button on the 'Add_New_Review_Body_Page' #done       
    #     Then I can see the Check and create review body page for '<Add_Review_Body>' #done
    #     And I click the 'Create_Profile' button on the 'Check_And_Create_Review_Body_Page' #done        
    #     Then I can see the create Review body confirmation page for '<Add_Review_Body>' #done
    #     When I Scan the page with the Axe Accessibilty Tool
    #     And I analyse the results from the Axe scan
    #     Then I expect to receive no WCAG Violations   

    #     Examples:
    #     | Add_Review_Body                      |
    #     | Valid_Data_In_All_Fields             | 
    #     | Valid_Data_In_All_Mandatory_Fields   |