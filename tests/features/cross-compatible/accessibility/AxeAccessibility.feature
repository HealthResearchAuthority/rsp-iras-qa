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
