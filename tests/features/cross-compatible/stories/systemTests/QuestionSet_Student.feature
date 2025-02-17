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
    When I fill the 'Educational_Project' section in the student page with '<Educational_Project>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Project   | Educational_Project       | Navigation_Button |
      | Project_X | Valid_Data_All_Fields     | Continue          |
      | Project_Y | University_Not_Sponsoring | Continue          |


  @rsp-1761
  Scenario Outline: Verify that correct validation has been applied to the student page
    And I enter the application name and description for '<Project>'
    And I click the 'Create' button on the 'Create_Application_Page'
    And I can see the proceed application page for '<Project>'
    And I click the 'Proceed_Application' button on the 'Proceed_Application_Page'
    And I can see the 'Project_Filter' question set
    And I click the 'Student' link on the 'Progress_Bar'
    And I can see the 'Student' question set
    When I fill the 'Educational_Project' section in the student page with '<Educational_Project>'
    When I click the 'Validate' button on the 'Question_Set'
    Then I see the expected validation errors appearing on the 'student' page based on those inputs
      | Section             | Dataset               |
      | Educational_Project | <Educational_Project> |

    Examples:
      | Project   | Educational_Project          |
      | Project_X | No_Fields_Completed          |
      | Project_Y | No_University_Or_Course_Name |