@ReceiveAmendments @TeamManagerDashboard @SystemTest @TeamManager
Feature: Receive Amendments: Team Manager Dashboard page that displays modifications that are in the process of being reviewed

    Background:
        Given I have navigated to the 'Approvals_Page'
        And I click the 'Team_Manager_Dashboard' link on the 'Approvals_Page'
        And I capture the page screenshot
        And I can see the 'Team_Manager_Dashboard_Page'
        And I can see the 'Column' ui labels on the team manager dashboard page

    @sortTeamManagerDashboardByColumn @rsp-4822 @KNOWN-DEFECT-RSP-6281 @fail
    Scenario Outline: Verify the user is able to sort the team manager dashboards by ascending and descending order for each results table column
        When I click the '<Sort_Button>' button on the 'Team_Manager_Dashboard_Page'
        And I capture the page screenshot
        Then I can see the tasklist on the 'Team_Manager_Dashboard_Page' is sorted by '<Initial_Sort>' order of the '<Sort_Field>'
        When I click the '<Sort_Button>' button on the 'Team_Manager_Dashboard_Page'
        And I capture the page screenshot
        Then I can see the tasklist on the 'Team_Manager_Dashboard_Page' is sorted by '<Secondary_Sort>' order of the '<Sort_Field>'

        Examples:
            | Sort_Button | Sort_Field | Initial_Sort | Secondary_Sort |
            | Status      | status     | ascending    | descending     |

    @searchTeamManagerDashboardStatus @rsp-4822
    Scenario Outline: Verify that modifications status' display as expected on the team manager dashboard
        When I enter an iras id for 'England' lead nation modification assigned to '<User>' with status '<Status>' into the search field
        And I click the 'Search' button on the 'Team_Manager_Dashboard_Page'
        Then I '<Visibility>' see the modification displayed in the 'Team_Manager_Dashboard_Page' list with '<Status>' status

        Examples:
            | Status                                 | User               | Visibility |
            | Modification_Status_Approved           | nobody             | cannot     |
            | Modification_Status_Not_Approved       | nobody             | cannot     |
            | Modification_Status_Received           | nobody             | can        |
            | Modification_Status_Review_In_Progress | Studywide_Reviewer | can        |