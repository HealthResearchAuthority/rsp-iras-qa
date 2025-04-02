@adminUser @questionSetTissue
# This Qset work was completed during Alpha phase with placeholder UI Screens
# QSet Feature not yet developed in actual application
# Therefore this feature is not part of the test pack
# But is being kept as most of the steps can be re-used once Qset is in development
# And the feature can be re-worked
Feature: Question Set - Research Application - Tissue

  Background:
    Given I have navigated to the 'Home_Page'
    And I click the 'Make_Changes_To_Research' button on the 'Home_Page'
    And I can see the 'Create_Application_Page'

  @rsp-1304
  Scenario Outline: Validate user is able to fill all sections in tissue page for a new research application
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Tissue' link on the 'Progress_Bar'
    And I can see the 'Tissue' question set
    When I fill the 'Human_Biological_Samples' section in the tissue page with '<Human_Biological_Samples>'
    And I fill the 'Health_Related_Findings' section in the tissue page with '<Health_Related_Findings>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Project   | Human_Biological_Samples      | Health_Related_Findings | Navigation_Button |
      | Project_X | Valid_Data_All_Fields         | Valid_Data_All_Fields   | Continue          |
      | Project_Y | New_Samples_From_Participants | Valid_Data_All_Fields   | Continue          |

  @rsp-1761
  Scenario Outline: Verify that correct validation has been applied to the tissue page
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Tissue' link on the 'Progress_Bar'
    And I can see the 'Tissue' question set
    When I fill the 'Human_Biological_Samples' section in the tissue page with '<Human_Biological_Samples>'
    And I fill the 'Health_Related_Findings' section in the tissue page with '<Health_Related_Findings>'
    And I click the 'Validate' button on the 'Question_Set'
    Then I see the expected validation errors appearing on the 'tissue' page based on those inputs
      | Section                  | Dataset                    |
      | Human_Biological_Samples | <Human_Biological_Samples> |
      | Health_Related_Findings  | <Health_Related_Findings>  |

    Examples:
      | Project   | Human_Biological_Samples | Health_Related_Findings |
      | Project_X | No_Fields_Completed      | No_Fields_Completed     |
      | Project_Y | Valid_Data_All_Fields    | No_Fields_Completed     |


  @rsp-2048 @rsp-2166
  Scenario Outline: Validate the question set labels in tissue page
    And I generate the list of expected values to validate 'question set field labels' for 'tissue'
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Tissue' link on the 'Progress_Bar'
    And I can see the 'Tissue' question set
    Then I validate the 'question set field labels' in application are as expected from the values received from excel for 'tissue'

    Examples:
      | Project   |
      | Project_X |

  @rsp-2049
  Scenario Outline: Validate the radio and checkbox labels for the question set in the tissue page
    And I generate the list of expected values to validate 'radio and checkbox labels' for 'tissue'
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Tissue' link on the 'Progress_Bar'
    And I can see the 'Tissue' question set
    Then I validate the 'radio and checkbox labels' in application are as expected from the values received from excel for 'tissue'

    Examples:
      | Project   |
      | Project_X |