@pocUser
Feature: This is a Testing Feature for POC Purposes

  Background:
    Given I have navigated to the tasks page
      | Page       |
      | Tasks_Page |

  Scenario Outline: Expected Tasks Appear for the POC User With Correct Data
    When I view the tasks table
    Then I see all projects that are assigned to the user using '<Project_Details>' dataset

    Examples:
      | Project_Details            |
      | Project_Details_POC_User_1 |

  @exampleTestTag
  Scenario Outline: POC User Can Access the Project Details Page, via the Tasks Page
    When I click anywhere on the "Prepare" project row
    Then I can see the project details page
    And the page title contains the projects task id using '<Project_Details>' dataset
    When I select my personal tasks from the banner options
    Then I can see the tasks page using '<TaskPage>' dataset

    Examples:
      | Project_Details            | TaskPage   |
      | Project_Details_POC_User_1 | Tasks_Page |
