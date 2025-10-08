@ApplicantUser @CreateProjectSmokeFeature @Smoke @run
Feature: Create Amendment - Create Project - Smoke Tests

  Background:
    Given I have navigated to the my research projects page
    And I can see the my research projects page

  @CreateProjectSmoke
  Scenario: Validate user is able to create a project
    And I can see the my research projects page
    And I capture the page screenshot
    When I click the 'Create_Project_Record' button on the 'My_Research_Projects_Page'
    Then I can see the create project record page
    And I capture the page screenshot
    When I click the 'Start' button on the 'Create_Project_Record_Page'
    And I can see the project details iras page
    And I capture the page screenshot
    And I fill the unique iras id in project details iras page
    And I capture the page screenshot
    When I click the 'Add_Project' button on the 'Project_Details_IRAS_Page'
    Then I can see the project details title page
    And I capture the page screenshot
    Then I fill the project details title page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Details_Title_Page'
    Then I can see the chief investigator page
    And I capture the page screenshot
    Then I fill the chief investigator page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    Then I click the 'Save_Continue' button on the 'Chief_Investigator_Page'
    Then I can see the research locations page
    And I capture the page screenshot
    Then I fill the research locations page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Research_Locations_Page'
    Then I can see the project identifiers page
    Then I fill the project identifiers page with 'Valid_Data_All_Fields'
    And I capture the page screenshot
    When I click the 'Save_Continue' button on the 'Project_Identifiers_Page'
    Then I can see the review your application page
    And I capture the page screenshot
    # Then I can validate the field values of 'Valid_Data_All_Fields' page 'Valid_Data_All_Fields' page and 'Valid_Data_All_Fields' page
    When I click the 'Confirm_Project_Details' button on the 'Review_Your_Answers_Page'
    Then I click the 'View_Project_Overview' link on the 'Confirmation_Page'
    Then I can see the project overview page
    And I capture the page screenshot