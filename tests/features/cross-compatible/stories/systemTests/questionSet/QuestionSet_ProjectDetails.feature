@adminUser @questionSetProjectDetails @SystemTest
Feature: Question Set - Research Application - Project Details

  Background:
    Given I have navigated to the 'Home_Page'
    And I click the 'Make_Changes_To_Research' button on the 'Home_Page'
    And I can see the 'Create_Application_Page'

  @rsp-1500 @rsp-1501 @rsp-1502
  Scenario Outline: Validate user is able to fill all sections in project details page for a new research application
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Project_Details' link on the 'Progress_Bar'
    And I can see the 'Project_Details' question set
    When I fill the project information section on the project details page with '<Project_Information>'
    And I fill the public involvement section on the project details page with '<Public_Involvement>'
    And I fill the research design and methodology section on the project details page with '<Research_Design>'
    And I fill the research activities section on the project details page with '<Research_Activities>'
    And I fill the participants section on the project details page with '<Participants>'
    And I fill the consent section on the project details page with '<Consent>'
    And I fill the risks and conflicts of interest section on the project details page with '<Risks_Conflicts>'
    And I fill the summary ethical issues section on the project details page with '<Summary_Ethical_Issues>'
    And I fill the research analysis section on the project details page with '<Research_Analysis>'
    And I fill the governance and management section on the project details page with '<Governance_Management>'
    And I fill the transparency section on the project details page with '<Transparency>'
    And I fill the confidentiality and information governance section on the project details page with '<Confidentiality_Info_Management>'
    Then I click the 'Continue' button on the 'Question_Set'

    Examples:
      | Project   | Project_Information          | Public_Involvement       | Research_Design          | Research_Activities      | Participants             | Consent                  | Risks_Conflicts          | Summary_Ethical_Issues   | Research_Analysis        | Governance_Management    | Transparency             | Confidentiality_Info_Management |
      | Project_X | Valid_Data_In_All_Fields     | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields        |
      | Project_Y | Protocol_Ref_Number_ABC_Data | No_Involvement           | Valid_Data_In_All_Fields | No_Standard_Of_Care      | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | No_Risks_Or_Conflicts    | No_Ethical_Concerns      | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Negative_Responses       | The_Answer_No                   |

@rsp-2048
  Scenario Outline: Validate the question set labels in project details page
    And I generate the list of expected values to validate 'question set field labels' for 'project details'
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Project_Details' link on the 'Progress_Bar'
    And I can see the 'Project_Details' question set
    Then I validate the 'question set field labels' in application are as expected from the values received from excel for 'project details'

    Examples:
      | Project   |
      | Project_X |