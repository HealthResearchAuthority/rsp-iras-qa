@adminUser @questionSetChildren @SystemTest
Feature: Question Set - Research Application - Children

  Background:
    Given I have navigated to the 'Home_Page'
    And I click the 'Make_Changes_To_Research' button on the 'Home_Page'
    And I can see the 'Create_Application_Page'

  @rsp-1305
  Scenario Outline: Validate user is able to fill all sections in children page for a new research application
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Children' link on the 'Progress_Bar'
    And I can see the 'Children' question set
    And I fill the 'children' section in the children page with '<Children>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Project   | Children                   | Navigation_Button |
      | Project_X | Valid_Data_All_Fields      | Continue          |
      | Project_Y | Child_Not_Treated_Urgently | Continue          |

  @rsp-1730
  Scenario Outline: Verify that correct validation has been applied on mandatory fields in the children page
  Validate error message displayed when user submit page with empty data in the children page
  Validate error message not displayed when user submit page with valid data for mandatory fields in the children page
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Children' link on the 'Progress_Bar'
    And I can see the 'Children' question set
    And I fill the 'children' section in the children page with '<Children>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'
    Then I validate error message using '<Validation_Message>' on mandatory fields for 'children' section in the children page with '<Children>'

    Examples:
      | Project   | Children              | Validation_Message         | Navigation_Button |
      | Project_X | All_Empty_Fields      | Empty_Fields_Error_Message | Validate          |
      | Project_Y | Some_Empty_Fields     | Empty_Fields_Error_Message | Validate          |
      | Project_X | Valid_Data_All_Fields | Empty_Fields_Error_Message | Validate          |
