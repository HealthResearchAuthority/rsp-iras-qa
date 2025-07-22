@ReceiveAmendments @ModificationsReadyToAssign @FrontStageUser @SystemTest
Feature: Modifications Tasklist page that displays modifications ready to be assigned

    Background:
        Given I have navigated to the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        And I can see the tasklist of modifications ready to assign is sorted by 'ascending' order of the 'date submitted'

    @SortTasklistByDateSubmitted @rsp-4091
    Scenario: Verify the user is able to sort the modifications tasklist by ascending order for date submitted
        When I click the 'Date_Submitted' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the tasklist of modifications ready to assign is sorted by 'descending' order of the 'date submitted'

        Examples:
            | Sort_Button    | Sort_Field     |
            | Date_Submitted | date submitted |


    @SortTasklistByColumn @rsp-4091 @KNOWN-DEFECT-RSP-4305
    Scenario: Verify the user is able to sort the modifications tasklist by ascending and descending order for each results table column
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the tasklist of modifications ready to assign is sorted by 'ascending' order of the '<Sort_Field>'
        When I click the '<Sort_Button>' button on the 'Modifications_Tasklist_Page'
        And I capture the page screenshot
        Then I can see the tasklist of modifications ready to assign is sorted by 'descending' order of the '<Sort_Field>'

        Examples:
            | Sort_Button           | Sort_Field            |
            | Modification_Id       | modification id       |
            | Short_Project_Title   | short project title   |
            | Modification_Type     | modification type     |
            | Days_Since_Submission | days since submission |