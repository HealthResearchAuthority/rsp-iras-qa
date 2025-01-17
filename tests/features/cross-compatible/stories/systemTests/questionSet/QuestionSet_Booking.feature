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
    And I fill the application booking section in the booking page with '<Booking>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Project   | Booking               | Navigation_Button |
      | Project_X | Valid_Data_All_Fields | Continue          |
      | Project_Y | Dont_Agree_Data       | Continue          |

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