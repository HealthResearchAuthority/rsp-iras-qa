@ReceiveAmendments @ModificationsReadyToAssign @FrontStageUser @SystemTest
Feature: Modifications Tasklist page that displays modifications ready to be assigned

    Background:
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot

    @SortTasklistByColumn @rsp-4091 @KNOWN-DEFECT-RSP-4305 @only
    Scenario: Verify the user is able to sort the modifications tasklist by ascending and descending order for each results table column
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the tasklist of modifications ready to assign is sorted by '<Initial_Sort>' order of the '<Sort_Field>'
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the tasklist of modifications ready to assign is sorted by '<Secondary_Sort>' order of the '<Sort_Field>'

        Examples:
            | Sort_Button           | Sort_Field            | Initial_Sort | Secondary_Sort |
            | Modification_Id       | modification id       | ascending    | descending     |
            | Short_Project_Title   | short project title   | ascending    | descending     |
            | Modification_Type     | modification type     | ascending    | descending     |
            | Date_Submitted        | date submitted        | descending   | ascending      |
            | Days_Since_Submission | days since submission | ascending    | descending     |