@RegressionSearchModifications @StudyWideReviewer @Regression @RegressionReceiveAmendments @BackStage

Feature: Receive Amendments: Search Modifications

        Background:
                Given I have navigated to the 'Home_Page'
                When I click the 'Approvals' link on the 'Home_Page'
                Then I can see the approvals home page
                And I click the 'Search' link on the 'Approvals_Page'
                Then I can see the 'Search_Modifications_Page'
                And I capture the page screenshot

        @RegressionSearchModificationsSortByColumn @rsp-4090 @rsp-4822
        Scenario Outline: Verify the user is able to sort the list of modifications by ascending and descending order for each results table column
                And I fill the search input for searching 'modifications' with 'Valid_Iras_Id_Prefix' as the search query
                And I click the 'Search' button on the 'Search_Modifications_Page'
                And I can now see a table of search results for modifications received for approval
                And I can see the list of modifications received for approval is sorted by 'descending' order of the 'modification id'
                And I capture the page screenshot
                When I click the '<Sort_Button>' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then I can see the list of modifications received for approval is sorted by 'ascending' order of the '<Sort_Field>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                Then I can see the list of modifications received for approval is sorted by 'ascending' order of the '<Sort_Field>'
                When I click the '<Sort_Button>' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
                And I can see the list of modifications received for approval is sorted by 'descending' order of the '<Sort_Field>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                Then I can see the list of modifications received for approval is sorted by 'descending' order of the '<Sort_Field>'
                Examples:
                        | Sort_Button         | Sort_Field          |
                        | Modification_Id     | modification id     |
                        | Short_Project_Title | short project title |
                        | Modification_Type   | modification type   |
                        | Chief_Investigator  | chief investigator  |
                        | Lead_Nation         | lead nation         |
                        | Status              | status              |

        @RegressionSearchModificationsAdvancedFilters @rsp-4011
        Scenario Outline: Verify the user is able to view the list of modifications by entering valid iras id, then clicking on 'Search' button and then selecting advanced filters and clicking the 'Apply filters' button
                When I enter '<Valid_Iras_Id>' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Search' button on the 'Search_Modifications_Page'
                And the system displays modification records based on the search '<Valid_Iras_Id>' and filter criteria ''
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I can see the list of modifications received for approval is sorted by 'descending' order of the 'modification id'
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And the system displays modification records based on the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>'
                And I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And the result count displayed at the top accurately reflects the number of records shown in the search modifications page
                And I capture the page screenshot
                And I can see the list of modifications received for approval is sorted by 'descending' order of the 'modification id'
                And I capture the page screenshot
                When I click the '<Sort_Button>' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then I can see the list of modifications received for approval is sorted by 'ascending' order of the '<Sort_Field>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                Then I can see the list of modifications received for approval is sorted by 'ascending' order of the '<Sort_Field>'
                When I click the '<Sort_Button>' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then I am on the 'first' page and it should be visually highlighted to indicate the active page the user is on
                And I can see the list of modifications received for approval is sorted by 'descending' order of the '<Sort_Field>'
                When I am on the 'last' page and it should be visually highlighted to indicate the active page the user is on
                And I capture the page screenshot
                Then I can see the list of modifications received for approval is sorted by 'descending' order of the '<Sort_Field>'
                Examples:
                        | Valid_Iras_Id        | Advanced_Filters             | Sort_Button         | Sort_Field          |
                        | Valid_Iras_Id_Prefix | Advanced_Filters_Lead_Nation | Modification_Id     | modification id     |
                        | Valid_Iras_Id_Prefix | Advanced_Filters_Twenty      | Short_Project_Title | short project title |
                        | Valid_Iras_Id_Prefix | Advanced_Filters_Twenty      | Modification_Type   | modification type   |
                        | Valid_Iras_Id_Prefix | Advanced_Filters_Twenty      | Chief_Investigator  | chief investigator  |
                        | Valid_Iras_Id_Prefix | Advanced_Filters_Lead_Nation | Lead_Nation         | lead nation         |

        @RegressionSearchModificationsFilterSort @rsp-4011
        Scenario Outline: Verify that the user can view the list of modifications by performing a search, applying advanced filters, and sorting the results in both ascending and descending order
                When I enter 'Valid_Iras_Id_Prefix' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Search' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I can now see a table of search results for modifications received for approval
                And I can see the list of modifications received for approval is sorted by 'descending' order of the 'modification id'
                And I capture the page screenshot
                When I click the '<Sort_Button>' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then I can see the list of modifications received for approval is sorted by 'ascending' order of the '<Sort_Field>'
                When I click the '<Sort_Button>' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then I can see the list of modifications received for approval is sorted by 'descending' order of the '<Sort_Field>'
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using 'Advanced_Filters_Checkboxes'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters 'Advanced_Filters_Checkboxes' in the 'Search_Modifications_Page'
                And the system displays modification records based on the search 'Valid_Iras_Id_Prefix' and filter criteria '<Advanced_Filters_Checkboxes>'
                And I capture the page screenshot
                And I can see the list of modifications received for approval is sorted by 'descending' order of the 'modification id'
                And I capture the page screenshot
                When I click the '<Sort_Button>' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then I can see the list of modifications received for approval is sorted by 'ascending' order of the '<Sort_Field>'
                When I click the '<Sort_Button>' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then I can see the list of modifications received for approval is sorted by 'descending' order of the '<Sort_Field>'
                Examples:
                        | Sort_Button         | Sort_Field          |
                        | Modification_Id     | modification id     |
                        | Short_Project_Title | short project title |
                        | Modification_Type   | modification type   |
                        | Chief_Investigator  | chief investigator  |
                        | Lead_Nation         | lead nation         |

        @RegressionSearchModificationsNoResultsFound @RegressionInvalidIrasIdAndAdvancedFilters
        Scenario Outline: Verify the user can see no matching results found message when no records match the search and filter criteria
                When I enter '<Invalid_Iras_Id>' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Advanced_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_Filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the 'Search_Modifications_Page'
                And the no search results found message is displayed
                And I capture the page screenshot
                Examples:
                        | Invalid_Iras_Id         | Advanced_Filters        |
                        | Invalid_Iras_Id_Letters | Advanced_Filters_Eleven |

        @RegressionSearchModificationsTitleBackLinksNav @rsp-5046 @rsp-5031
        Scenario: Verify back and short project title link navigation for search modifications tasklist
                And I fill the search input for searching 'modifications' with 'Valid_Full_Iras_Id' as the search query
                And I click the 'Search' button on the 'Search_Modifications_Page'
                And I can now see a table of search results for modifications received for approval
                And Each 'short project title' displayed on the 'Search_Modifications_Page' is a link
                When I click a 'short project title' on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then I can see the project overview page
                When I click the 'Back' link on the 'Project_Overview_Page'
                And I capture the page screenshot
                Then I can see the 'Search_Modifications_Page'
                When I fill the search input for searching 'modifications' with 'Valid_Full_Iras_Id' as the search query
                And I click the 'Search' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I can now see a table of search results for modifications received for approval
                Then Each 'modification id' displayed on the 'Search_Modifications_Page' is a link
                When I click a 'modification id' on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then I can see the review all changes modifications page
                When I click the 'Back' link on the 'Review_All_Changes_Page'
                And I capture the page screenshot
                Then I can see the 'Search_Modifications_Page'
                When I click the 'Back' link on the 'Search_Modifications_Page'
                Then I can see the approvals home page
                When I click the 'Back' link on the 'Approvals_Page'
                Then I can see the 'Home_Page'
