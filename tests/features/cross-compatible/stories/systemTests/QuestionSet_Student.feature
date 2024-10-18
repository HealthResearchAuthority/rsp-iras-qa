@adminUser @questionSetStudent @SystemTest
Feature: Question Set - Research Application - Student

  Background:
    Given I have navigated to the 'Home_Page'
    And I click the 'New_Application' button on the 'Home_Page'
    And I can see the 'Create_Application_Page'

  @rsp-1304
  Scenario Outline: Validate user is able to fill all sections in student page for a new research application
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Student' link on the 'Progress_Bar'
    And I can see the 'Student' question set
    When I fill the educational project section in the student page with '<Educational_Project>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Project   | Educational_Project       | Navigation_Button |
      | Project_X | Valid_Data_All_Fields     | Continue          |
      | Project_Y | University_Not_Sponsoring | Continue          |
