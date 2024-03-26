@pocUser
Feature: This is a Testing Feature for POC Purposes

    Background:
        Given I have navigated to the Tasks Page

    Scenario: Expected Tasks Appear for the POC User With Correct Data
        When I View the Tasks Table
        Then I see all projects that are assigned to the POC user
            | Task            | Task ID   | IRAS ID | Short project title       | Chief investigator |
            | Prepare project | P-5153308 | 5153308 | Access QSets at same time | Atul Patel         |

    @exampleTestTag
    Scenario: POC User Can Access the Project Details Page, via the Tasks Page
        When I click anywhere on the "Prepare" project row
        Then I can see the Project Details Page
        And the page title contains the Projects Task ID - "P-5153308"
        When I select My Personal Tasks from the Banner Options
        Then I can see the Tasks Page
