@adminUser @questionSetALC @SystemTest
Feature: Question Set - Research Application - Adults Lacking Capacity

  Background:
    Given I have navigated to the 'Home_Page'
    And I click the 'Make_Changes_To_Research' button on the 'Home_Page'
    And I can see the 'Create_Application_Page'

  @rsp-1305
  Scenario Outline: Validate user is able to fill all sections in adults lacking capacity page for a new research application
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Adults_Lacking_Capacity' link on the 'Progress_Bar'
    And I can see the 'Adults_Lacking_Capacity' question set
    And I fill the 'adults lacking capacity ctimp' section in the adults lacking capacity page with '<Adults_Lacking_Capacity_CTIMP>'
    And I fill the 'adults lacking capacity non ctimp' section in the adults lacking capacity page with '<Adults_Lacking_Capacity_Non_CTIMP>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Project   | Adults_Lacking_Capacity_CTIMP                  | Adults_Lacking_Capacity_Non_CTIMP | Navigation_Button |
      | Project_X | Valid_Data_All_Fields                          | Valid_Data_All_Fields             | Continue          |
      | Project_Y | Participant_With_No_Urgent_Treatment_Recruited | Valid_Data_All_Fields             | Continue          |

  @rsp-1730
  Scenario Outline: Verify that correct validation has been applied on mandatory fields in the adults lacking page
  Validate error message displayed when user submit page with empty data in the adults lacking capacity page
  Validate error message not displayed when user submit page with valid data for mandatory fields in the adults lacking capacity page
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Adults_Lacking_Capacity' link on the 'Progress_Bar'
    And I can see the 'Adults_Lacking_Capacity' question set
    And I fill the 'adults lacking capacity ctimp' section in the adults lacking capacity page with '<Adults_Lacking_Capacity_CTIMP>'
    And I fill the 'adults lacking capacity non ctimp' section in the adults lacking capacity page with '<Adults_Lacking_Capacity_Non_CTIMP>'
    And I click the '<Navigation_Button>' button on the 'Question_Set'
    Then I validate error message using '<Validation_Message>' on mandatory fields for 'adults lacking capacity ctimp' section in the adults lacking capacity page with '<Adults_Lacking_Capacity_CTIMP>'
    Then I validate error message using '<Validation_Message>' on mandatory fields for 'adults lacking capacity non ctimp' section in the adults lacking capacity page with '<Adults_Lacking_Capacity_Non_CTIMP>'

    Examples:
      | Project   | Adults_Lacking_Capacity_CTIMP | Adults_Lacking_Capacity_Non_CTIMP | Validation_Message         | Navigation_Button |
      | Project_X | All_Empty_Fields              | All_Empty_Fields                  | Empty_Fields_Error_Message | Validate          |
      | Project_Y | Some_Empty_Fields             | Some_Empty_Fields                 | Empty_Fields_Error_Message | Validate          |
      | Project_X | Valid_Data_All_Fields         | Valid_Data_All_Fields             | Empty_Fields_Error_Message | Validate          |
