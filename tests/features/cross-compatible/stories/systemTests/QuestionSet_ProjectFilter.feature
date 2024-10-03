@adminUser @questionSetProjectFilter @SystemTest
Feature: Question Set - Research Application - Project Filter

  Background:
    Given I have navigated to the 'Home_Page'

  @rsp-1504
  Scenario Outline: Validate user is able to fill all sections in project filter page for a new research application
    Then I can see a '<Application_Button>' button on the 'Home_Page'
    And I click the '<Application_Button>' button on the 'Home_Page'
    Then I can see the project filter page
    And I fill the project details section in the project filter page using the '<Project_Details>' dataset
    And I fill the project scope section in the project filter page using the '<Project_Scope>' dataset
    And I fill the research location section in the project filter page using the '<Research_Location>' dataset
    Then I can see a '<Navigation_Button>' button on the 'Question_Set'
    And I click the '<Navigation_Button>' button on the 'Question_Set'

    Examples:
      | Application_Button | Project_Details               | Project_Scope        | Research_Location        | Navigation_Button |
      | New_Application    | Project_Details_Common        | Project_Scope_Common | Research_Location_Common | Continue          |
      | New_Application    | Project_Details_NoNIHRFunding | Project_Scope_Common | Research_Location_Common | Continue          |