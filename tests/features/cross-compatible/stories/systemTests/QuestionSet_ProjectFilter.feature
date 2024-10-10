@adminUser @questionSetProjectFilter @SystemTest
Feature: Question Set - Research Application - Project Filter

  Background:
    Given I have navigated to the 'Home_Page'
    And I click the 'New_Application' button on the 'Home_Page'
    And I can see the 'Create_Application_Page'

  @rsp-1504
  Scenario Outline: Validate user is able to fill all sections in project filter page for a new research application
    And I enter the Application Name and Description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the Proceed Application Page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' Question Set
    When I fill the Project Details section in the Project Filter page with '<Project_Details>'
    And I fill the Project Scope section in the Project Filter page with '<Project_Scope>'
    And I fill the Research Location section in the Project Filter page with '<Research_Location>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Project   | Project_Details           | Project_Scope         | Research_Location     | Navigation_Button |
      | Project_X | Valid_Data_All_Fields     | Valid_Data_All_Fields | Valid_Data_All_Fields | Continue          |
      | Project_Y | Data_With_No_NIHR_Funding | Valid_Data_All_Fields | Valid_Data_All_Fields | Continue          |
