@adminUser @questionSetProjectDetails
# This Qset work was completed during Alpha phase with placeholder UI Screens
# QSet Feature not yet developed in actual application
# Therefore this feature is not part of the test pack
# But is being kept as most of the steps can be re-used once Qset is in development
# And the feature can be re-worked
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
    When I fill the 'Project_Information' section on the project details page with '<Project_Information>'
    And I fill the 'Public_Involvement' section on the project details page with '<Public_Involvement>'
    And I fill the 'Research_Design' section on the project details page with '<Research_Design>'
    And I fill the 'Research_Activities' section on the project details page with '<Research_Activities>'
    And I fill the 'Participants' section on the project details page with '<Participants>'
    And I fill the 'Consent' section on the project details page with '<Consent>'
    And I fill the 'Risks_Conflicts' section on the project details page with '<Risks_Conflicts>'
    And I fill the 'Summary_Ethical_Issues' section on the project details page with '<Summary_Ethical_Issues>'
    And I fill the 'Research_Analysis' section on the project details page with '<Research_Analysis>'
    And I fill the 'Governance_Management' section on the project details page with '<Governance_Management>'
    And I fill the 'Transparency' section on the project details page with '<Transparency>'
    And I fill the 'Confidentiality_Info_Management' section on the project details page with '<Confidentiality_Info_Management>'
    Then I click the 'Continue' button on the 'Question_Set'

    Examples:
      | Project   | Project_Information          | Public_Involvement       | Research_Design          | Research_Activities      | Participants             | Consent                  | Risks_Conflicts          | Summary_Ethical_Issues   | Research_Analysis        | Governance_Management    | Transparency             | Confidentiality_Info_Management |
      | Project_X | Valid_Data_In_All_Fields     | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields        |
      | Project_Y | Protocol_Ref_Number_ABC_Data | No_Involvement           | Valid_Data_In_All_Fields | No_Standard_Of_Care      | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | No_Risks_Or_Conflicts    | No_Ethical_Concerns      | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Negative_Responses       | The_Answer_No                   |

  @rsp-1503
  Scenario Outline: Verify that correct validation has been applied to the project details page
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Project_Details' link on the 'Progress_Bar'
    And I can see the 'Project_Details' question set
    When I fill the 'Project_Information' section on the project details page with '<Project_Information>'
    And I fill the 'Public_Involvement' section on the project details page with '<Public_Involvement>'
    And I fill the 'Research_Design' section on the project details page with '<Research_Design>'
    And I fill the 'Research_Activities' section on the project details page with '<Research_Activities>'
    And I fill the 'Participants' section on the project details page with '<Participants>'
    And I fill the 'Consent' section on the project details page with '<Consent>'
    And I fill the 'Risks_Conflicts' section on the project details page with '<Risks_Conflicts>'
    And I fill the 'Summary_Ethical_Issues' section on the project details page with '<Summary_Ethical_Issues>'
    And I fill the 'Research_Analysis' section on the project details page with '<Research_Analysis>'
    And I fill the 'Governance_Management' section on the project details page with '<Governance_Management>'
    And I fill the 'Transparency' section on the project details page with '<Transparency>'
    And I fill the 'Confidentiality_Info_Management' section on the project details page with '<Confidentiality_Info_Management>'
    And I click the 'Validate' button on the 'Question_Set'
    Then I see the expected validation errors appearing on the 'project details' page based on those inputs
      | Section                         | Dataset                           |
      | Project_Information             | <Project_Information>             |
      | Public_Involvement              | <Public_Involvement>              |
      | Research_Design                 | <Research_Design>                 |
      | Research_Activities             | <Research_Activities>             |
      | Participants                    | <Participants>                    |
      | Consent                         | <Consent>                         |
      | Risks_Conflicts                 | <Risks_Conflicts>                 |
      | Summary_Ethical_Issues          | <Summary_Ethical_Issues>          |
      | Research_Analysis               | <Research_Analysis>               |
      | Governance_Management           | <Governance_Management>           |
      | Transparency                    | <Transparency>                    |
      | Confidentiality_Info_Management | <Confidentiality_Info_Management> |

    Examples:
      | Project   | Project_Information      | Public_Involvement       | Research_Design       | Research_Activities      | Participants             | Consent                  | Risks_Conflicts          | Summary_Ethical_Issues   | Research_Analysis        | Governance_Management    | Transparency             | Confidentiality_Info_Management |
      | Project_X | No_Fields_Completed      | No_Fields_Completed      | No_Fields_Completed   | No_Fields_Completed      | No_Fields_Completed      | No_Fields_Completed      | No_Fields_Completed      | No_Fields_Completed      | No_Fields_Completed      | No_Fields_Completed      | No_Fields_Completed      | No_Fields_Completed             |
      | Project_Y | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Methods_Using_Omitted | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields        |

  @rsp-2048 @rsp-2166
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

  @rsp-2049
  Scenario Outline: Validate the radio and checkbox labels for the question set in the project details page
    And I generate the list of expected values to validate 'radio and checkbox labels' for 'project details'
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Project_Details' link on the 'Progress_Bar'
    And I can see the 'Project_Details' question set
    Then I validate the 'radio and checkbox labels' in application are as expected from the values received from excel for 'project details'

    Examples:
      | Project   |
      | Project_X |