@adminUser @questionSetDevices @SystemTest
Feature: Question Set - Research Application - Devices

  Background:
    Given I have navigated to the 'Home_Page'
    And I click the 'Make_Changes_To_Research' button on the 'Home_Page'
    And I can see the 'Create_Application_Page'

  @rsp-1304
  Scenario Outline: Validate user is able to fill all sections in devices page for a new research application
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Devices' link on the 'Progress_Bar'
    And I can see the 'Devices' question set
    And I fill the devices filter questions section in the devices page with '<Devices_Filter_Questions>'
    And I fill the device investigation no mhra section in the devices page with '<Device_Investigation_No_MHRA>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Project   | Devices_Filter_Questions            | Device_Investigation_No_MHRA | Navigation_Button |
      | Project_X | Valid_Data_All_Fields               | Valid_Data_All_Fields        | Continue          |
      | Project_Y | Research_Conducted_Northern_Ireland | Valid_Data_All_Fields        | Continue          |

  @rsp-2048 @rsp-2166
  Scenario Outline: Validate the question set labels in devices page
    And I generate the list of expected values to validate 'question set field labels' for 'devices'
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Devices' link on the 'Progress_Bar'
    And I can see the 'Devices' question set
    Then I validate the 'question set field labels' in application are as expected from the values received from excel for 'devices'

    Examples:
      | Project   |
      | Project_X |

  @rsp-2049
  Scenario Outline: Validate the radio and checkbox labels for the question set in the devices page
    And I generate the list of expected values to validate 'radio and checkbox labels' for 'devices'
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Devices' link on the 'Progress_Bar'
    And I can see the 'Devices' question set
    Then I validate the 'radio and checkbox labels' in application are as expected from the values received from excel for 'devices'

    Examples:
      | Project   |
      | Project_X |