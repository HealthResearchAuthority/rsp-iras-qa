@adminUser @questionSetBooking
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
    When I fill the 'Application_Booking' section in the booking page with '<Application_Booking>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Project   | Application_Booking   | Navigation_Button |
      | Project_X | Valid_Data_All_Fields | Continue          |
      | Project_Y | Dont_Agree_Data       | Continue          |

  @rsp-1730
  Scenario Outline: Verify that correct validation has been applied on mandatory fields in the booking page
    Validate error message displayed when user submit page with empty data in the booking page
    Validate error message not displayed when user submit page with valid data for mandatory fields in the booking page
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Booking' link on the 'Progress_Bar'
    And I can see the 'Booking' question set
    When I fill the 'Application_Booking' section in the booking page with '<Application_Booking>'
    And I click the 'Validate' button on the 'Question_Set'
    Then I see the expected validation errors appearing on the 'booking' page based on those inputs
      | Section             | Dataset               |
      | Application_Booking | <Application_Booking> |

    Examples:
      | Project   | Application_Booking |
      | Project_X | All_Empty_Fields    |

  @rsp-2048 @rsp-2166
  Scenario Outline: Validate the question set labels in booking page
    And I generate the list of expected values to validate 'question set field labels' for 'booking'
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Booking' link on the 'Progress_Bar'
    And I can see the 'Booking' question set
    Then I validate the 'question set field labels' in application are as expected from the values received from excel for 'booking'

    Examples:
      | Project   |
      | Project_X |

  @rsp-2049
  Scenario Outline: Validate the radio and checkbox labels for the question set in the booking page
    And I generate the list of expected values to validate 'radio and checkbox labels' for 'booking'
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Booking' link on the 'Progress_Bar'
    And I can see the 'Booking' question set
    Then I validate the 'radio and checkbox labels' in application are as expected from the values received from excel for 'booking'

    Examples:
      | Project   |
      | Project_X |