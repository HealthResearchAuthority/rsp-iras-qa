@adminUser @questionSetBooking @SystemTest
Feature: Question Set - Research Application - Booking

  Background:
    Given I have navigated to the 'Home_Page'
    And I click the 'Make_Changes_To_Research' button on the 'Home_Page'
    And I can see the 'Create_Application_Page'

  @rsp-1305
  Scenario Outline: Validate user is able to fill all sections in booking page for a new research application
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Booking' link on the 'Progress_Bar'
    And I can see the 'Booking' question set
    And I fill the application 'application booking' section in the booking page with '<Booking>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Project   | Booking               | Navigation_Button |
      | Project_X | Valid_Data_All_Fields | Continue          |
      | Project_Y | Dont_Agree_Data       | Continue          |

  @rsp-17301
  Scenario Outline: Validate error message displayed when user submit page with empty data and error message not displayed when user submit with valid data for mandatory fields in the booking page
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Booking' link on the 'Progress_Bar'
    And I can see the 'Booking' question set
    And I fill the application 'application booking' section in the booking page with '<Booking>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'
    Then I validate error message using '<Validation_Message>' on mandatory fields for 'application booking' section in the booking page with '<Children>'

    Examples:
      | Project   | Booking               | Validation_Message         | Navigation_Button |
      | Project_X | All_Empty_Fields      | Empty_Fields_Error_Message | Validate          |
      | Project_X | Valid_Data_All_Fields | Empty_Fields_Error_Message | Validate          |
