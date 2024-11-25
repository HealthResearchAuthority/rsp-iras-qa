@adminUser @questionSetProjectFilter @SystemTest
Feature: Question Set - Research Application - Project Filter

  Background:
    Given I have navigated to the 'Home_Page'
    And I click the 'New_Application' button on the 'Home_Page'
    And I can see the 'Create_Application_Page'

  @rsp-1504
  Scenario Outline: Validate user is able to fill all sections in project filter page for a new research application
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    When I fill the project details section in the project filter page with '<Project_Details>'
    And I fill the project scope section in the project filter page with '<Project_Scope>'
    And I fill the research location section in the project filter page with '<Research_Location>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Project   | Project_Details           | Project_Scope         | Research_Location     | Navigation_Button |
      | Project_X | Valid_Data_All_Fields     | Valid_Data_All_Fields | Valid_Data_All_Fields | Continue          |
      | Project_Y | Data_With_No_NIHR_Funding | Valid_Data_All_Fields | Valid_Data_All_Fields | Continue          |

  @rsp-1503
  Scenario Outline: Verify that correct validation has been applied to the project filter page
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    When I fill the project details section in the project filter page with '<Project_Details>'
    And I fill the project scope section in the project filter page with '<Project_Scope>'
    And I fill the research location section in the project filter page with '<Research_Location>'
    And I click the 'Validate' button on the 'Question_Set'
    Then I see the expected validation errors appearing for '<Validation>' on the project filter page

    Examples:
      | Project   | Project_Details            | Project_Scope         | Research_Location     | Validate_Button | Validation           |
      | Project_X | No_Fields_Completed        | No_Fields_Completed   | No_Fields_Completed   | Validate        | All_Mandatory_Fields |
      | Project_Y | Full_Project_Title_Omitted | Valid_Data_All_Fields | Valid_Data_All_Fields | Validate        | Full_Project_Title   |
