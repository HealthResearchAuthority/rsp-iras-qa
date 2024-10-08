@adminUser @questionSetProjectDetails @SystemTest @only
Feature: Question Set - Research Application - Project Details

  Background:
    Given I have navigated to the 'Home_Page'

  @rsp-1500
  Scenario Outline: Validate user is able to fill all sections in project filter page for a new research application
    And I click the '<Application_Button>' button on the 'Home_Page'
    And I click the 'Project_Details' link on the 'Progress_Bar'
    And I can see the project details page
    When I fill the Project Information section on the project details page with '<Project_Information>'
    And I fill the Public Involvement section on the project details page with '<Public_Involvement>'
    And I fill the Research Design and Methodology section on the project details page with '<Research_Design>'
    And I fill the Research Activities section on the project details page with '<Research_Activities>'
    And I fill the Participants section on the project details page with '<Participants>'
    Then I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Application_Button | Project_Information      | Public_Involvement       | Research_Design          | Research_Activities      | Participants             | Navigation_Button |
      | New_Application    | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Valid_Data_In_All_Fields | Continue          |
# | New_Application    | Project_Details_NoNIHRFunding | Project_Scope_Common | Research_Location_Common | Continue          |