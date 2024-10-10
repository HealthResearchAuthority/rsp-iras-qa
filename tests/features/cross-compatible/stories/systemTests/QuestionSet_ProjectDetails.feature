@adminUser @questionSetProjectDetails @SystemTest
Feature: Question Set - Research Application - Project Details

  Background:
    Given I have navigated to the 'Home_Page'
    And I click the 'New_Application' button on the 'Home_Page'
    And I can see the 'Create_Application_Page'

  @rsp-1500
  Scenario Outline: Validate user is able to fill all sections in project details page for a new research application
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' Question Set
    And I click the 'Project_Details' link on the 'Progress_Bar'
    And I can see the 'Project_Details' Question Set
    When I fill the project information section on the project details page with '<Project_Information>'
    And I fill the public involvement section on the project details page with '<Public_Involvement>'
    And I fill the research design and methodology section on the project details page with '<Research_Design>'
    And I fill the research activities section on the project details page with '<Research_Activities>'
    And I fill the participants section on the project details page with '<Participants>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Project   | Project_Information          | Public_Involvement       | Research_Design          | Research_Activities      | Participants             | Navigation_Button |
      | Project_X | Valid_Data_In_All_Fields     | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Continue          |
      | Project_Y | Protocol_Ref_Number_ABC_Data | No_Involvement           | Valid_Data_In_All_Fields | No_Standard_Of_Care      | Valid_Data_In_All_Fields | Continue          |