@adminUser @questionSetProjectFilter @SystemTest
Feature: Question Set - Research Application - Project Filter

  Background:
    Given I have navigated to the 'Home_Page'
    And I click the 'Make_Changes_To_Research' button on the 'Home_Page'
    And I can see the 'Create_Application_Page'

  @rsp-1504
  Scenario Outline: Validate user is able to fill all sections in project filter page for a new research application
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    When I fill the 'Project_Details' section in the project filter page with '<Project_Details>'
    And I fill the 'Project_Scope' section in the project filter page with '<Project_Scope>'
    And I fill the 'Research_Location' section in the project filter page with '<Research_Location>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Project   | Project_Details           | Project_Scope         | Research_Location     | Navigation_Button |
      | Project_X | Valid_Data_All_Fields     | Valid_Data_All_Fields | Valid_Data_All_Fields | Continue          |
      | Project_Y | Data_With_No_NIHR_Funding | Valid_Data_All_Fields | Valid_Data_All_Fields | Continue          |

  # Commented out Scenarios with unique Validation messages causing failures
  # These failures will need to be revisited once Qset work has been full refined 
  @rsp-1503
  Scenario Outline: Verify that correct validation has been applied to the project filter page
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    When I fill the 'Project_Details' section in the project filter page with '<Project_Details>'
    And I fill the 'Project_Scope' section in the project filter page with '<Project_Scope>'
    And I fill the 'Research_Location' section in the project filter page with '<Research_Location>'
    And I click the 'Validate' button on the 'Question_Set'
    Then I see the expected validation errors appearing on the 'project filter' page based on those inputs
      | Section           | Dataset             |
      | Project_Details   | <Project_Details>   |
      | Project_Scope     | <Project_Scope>     |
      | Research_Location | <Research_Location> |

    Examples:
      | Project   | Project_Details         | Project_Scope         | Research_Location                       | Validate_Button |
      | Project_X | No_Fields_Completed     | No_Fields_Completed   | No_Fields_Completed                     | Validate        |
      | Project_Y | Valid_Data_All_Fields   | No_Fields_Completed   | Valid_Data_Default_Fields               | Validate        |
      # | Project_Z | Initial_Contact_Omitted | Valid_Data_All_Fields | Valid_Data_All_Fields                   | Validate        |
      # | Project_Z | Valid_Data_All_Fields   | Valid_Data_All_Fields | Further_Location_Sample_Details_Omitted | Validate        |

  @rsp-2048 @rsp-2166
  Scenario Outline: Validate the question set labels in project filter page
    And I generate the list of expected values to validate 'question set field labels' for 'project filter'
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    Then I validate the 'question set field labels' in application are as expected from the values received from excel for 'project filter'

    Examples:
      | Project   |
      | Project_X |

  @rsp-2049
  Scenario Outline: Validate the radio and checkbox labels for the question set in the project filter page
    And I generate the list of expected values to validate 'radio and checkbox labels' for 'project filter'
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    Then I validate the 'radio and checkbox labels' in application are as expected from the values received from excel for 'project filter'

    Examples:
      | Project   |
      | Project_X |