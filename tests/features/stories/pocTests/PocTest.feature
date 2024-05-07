@pocUser @pocFeature
Feature: This is a Testing Feature for POC Purposes

    Background:
        Given I have navigated to the 'Tasks_Page'

    @RSP-544 @pocTaskscenario
    Scenario Outline: Expected Tasks Appear for the POC User With Correct Data
        When I view the tasks table
        Then I see all projects that are assigned to the '<Project_Details>'

        Examples:
            | Project_Details |
            | POC_User        |

    @RSP-544 @pocProjectDetailsScenario
    Scenario Outline: POC User Can Access the Project Details Page, via the Tasks Page
        When I click anywhere on the "Prepare" project row
        Then I can see the project details page
        And  I verify that the page title contains the projects task id in the '<Project_Details>'
        When I select my personal tasks from the banner options
        Then I can see the '<Page>'

        Examples:
            | Project_Details | Page       |
            | POC_User        | Tasks_Page |
