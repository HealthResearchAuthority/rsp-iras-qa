@ReceiveAmendments @SortModificationResults @FrontStageUser @SystemTest @rsp-4090

Feature: Receive Amendments: Sort modification results after performing a search

    Background:
        Given I have navigated to the 'Search_Modifications_Page'
        And I fill the search input for searching 'modifications' with 'Valid_Iras_Id_Prefix' as the search query
        And I click the 'Search' button on the 'Search_Modifications_Page'
        And I can see the list is sorted by 'descending' order of the 'modification id'
        And the system displays modification records matching the search criteria of 'Valid_Iras_Id_Prefix'
        And I capture the page screenshot

    @SortModificationsByColumn
    Scenario: Verify the user is able to sort the list of modifications by ascending and descending order for each results table column
        When I click the '<Sort_Button>' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        Then I can see the list is sorted by 'ascending' order of the '<Sort_Field>'
        When I click the '<Sort_Button>' button on the 'Search_Modifications_Page'
        And I capture the page screenshot
        Then I can see the list is sorted by 'descending' order of the '<Sort_Field>'

        Examples:
            | Sort_Button         | Sort_Field          |
            | Modification_Id     | modification id     |
            | Short_Project_Title | short project title |
            | Modification_Type   | modification type   |
            | Chief_Investigator  | chief investigator  |
            | Lead_Nation         | lead nation         |