@pocUser @pocFeature @Smoke
Feature: This is a Testing Feature for POC Purposes

  Background:
    Given I have navigated to the 'Tasks_Page'

  @Smoke
  Scenario Outline: Sample Smoke Test case
    When I view the tasks table
    Then I see all projects that are assigned to the '<Project_Details>'

    Examples:
      | Project_Details |
      | POC_User        |