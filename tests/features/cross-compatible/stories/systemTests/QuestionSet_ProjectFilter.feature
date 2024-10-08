@adminUser @questionSetProjectFilter @SystemTest @only
Feature: Question Set - Research Application - Project Filter

  Background:
    Given I have navigated to the 'Home_Page'

  @rsp-1504
  Scenario Outline: Validate user is able to fill all sections in project filter page for a new research application
    And I click the '<Application_Button>' button on the 'Home_Page'
    And I can see the project filter page
    When I fill the project details section in the project filter page with '<Project_Details>'
    And I fill the project scope section in the project filter page with '<Project_Scope>'
    And I fill the research location section in the project filter page with '<Research_Location>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Application_Button | Project_Details           | Project_Scope         | Research_Location     | Navigation_Button |
      | New_Application    | Valid_Data_All_Fields     | Valid_Data_All_Fields | Valid_Data_All_Fields | Continue          |
      | New_Application    | Data_With_No_NIHR_Funding | Valid_Data_All_Fields | Valid_Data_All_Fields | Continue          |
