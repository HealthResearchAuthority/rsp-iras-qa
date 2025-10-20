@UserAdministration @ManageReviewBodies @SortSearchFilterReviewBodies @SysAdminUser @SystemTest
Feature: User Administration: Manage Review Bodies - Sort, search and filter the review body list

    Background:
        Given I have navigated to the 'Manage_Review_Bodies_Page'
        And I can see the 'manage review bodies' list sorted by 'ascending' order of the 'organisation name' on the 'first' page

    @sortReviewBodyListByColumn @RSP-3546
    Scenario Outline: Verify the user is able to sort the manage review bodies list by ascending and descending order for each table column
        When I click the '<Sort_Button>' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then I can see the 'manage review bodies' list sorted by '<Initial_Sort>' order of the '<Sort_Field>' on the 'first' page
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then I can see the 'manage review bodies' list sorted by '<Initial_Sort>' order of the '<Sort_Field>' on the 'last' page
        When I click the '<Sort_Button>' button on the 'Manage_Review_Bodies_Page'
        And I capture the page screenshot
        Then I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
        And I can see the 'manage review bodies' list sorted by '<Secondary_Sort>' order of the '<Sort_Field>' on the 'first' page
        When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
        And I capture the page screenshot
        Then I can see the 'manage review bodies' list sorted by '<Secondary_Sort>' order of the '<Sort_Field>' on the 'last' page

        Examples:
            | Sort_Button | Sort_Field        | Initial_Sort | Secondary_Sort |
            | Org_Name    | organisation name | descending   | ascending      |
            | Country     | country           | ascending    | descending     |
            | Status      | status            | ascending    | descending     |
