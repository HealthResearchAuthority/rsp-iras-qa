@RegressionSearchModifications @FrontStageUser @Regression @RegressionReceiveAmendments

Feature: Receive Amendments: Search Modifications

        Background:
                Given I have navigated to the 'Search_Modifications_Page'

        @RegressionSortModificationsByColumn @rsp-4090
        # NOTE: ADD TIJI's FILTER SETUP STEPS ONCE MERGED, TO COVER RSP-4305 DEFECT
        Scenario Outline: Verify the user is able to sort the list of modifications by ascending and descending order for each results table column
                And I fill the search input for searching 'modifications' with 'Valid_Iras_Id_Prefix' as the search query
                And I click the 'Search' button on the 'Search_Modifications_Page'
                And I can now see a table of search results for modifications received for approval
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

        @RegressionSearchAdvancedFilterModifications @KNOWN-DEFECT-RSP-4467 @KNOWN-DEFECT-RSP-4305 @rsp-4011
        Scenario Outline: Verify the user is able to view the list of modifications by entering valid iras id, then clicking on 'Search' button and then selecting advanced filters and clicking the 'Apply filters' button
                When I enter '<Valid_Iras_Id>' into the search field for search modifications page
                And I capture the page screenshot
                And I click the 'Search' button on the 'Search_Modifications_Page'
                Then the system displays modification records matching the search criteria of '<Valid_Iras_Id>' in the search modifications page
                And the result count displayed at the top accurately reflects the number of records shown
                And I can see the list of modifications received for approval is sorted by 'descending' order of the 'modification id'
                And I capture the page screenshot
                And I click the 'Advanced_Filter' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using '<Advanced_Filters>'
                And I capture the page screenshot
                And I click the 'Apply_filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters '<Advanced_Filters>' in the search modifications page
                And the system displays modification records matching the search '<Valid_Iras_Id>' and filter criteria '<Advanced_Filters>' in the search modifications page
                And the result count displayed at the top accurately reflects the number of records shown
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
                        | Valid_Iras_Id        | Advanced_Filters             | Sort_Button         | Sort_Field          |
                        | Valid_Iras_Id_Nth    | Advanced_Filters_Lead_Nation | Modification_Id     | modification id     |
                        | Valid_Iras_Id_Prefix | Advanced_Filters_Twenty      | Short_Project_Title | short project title |
                        | Valid_Iras_Id_Prefix | Advanced_Filters_TwentyOne   | Modification_Type   | modification type   |
                        | Valid_Iras_Id_Prefix | Advanced_Filters_TwentyTwo   | Chief_Investigator  | chief investigator  |
                        | Valid_Iras_Id_Prefix | Advanced_Filters_Lead_Nation | Lead_Nation         | lead nation         |

        @RegressionSearchSortAdvancedFilterModifications @KNOWN-DEFECT-RSP-4305 @KNOWN-DEFECT-RSP-4467 @rsp-4011
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
                And I click the 'Advanced_Filter' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                And I select advanced filters in the search modifications page using 'Advanced_Filters_Checkboxes'
                And I capture the page screenshot
                And I click the 'Apply_filters' button on the 'Search_Modifications_Page'
                And I capture the page screenshot
                Then 'I can see the selected filters are displayed under' active filters 'Advanced_Filters_Checkboxes' in the search modifications page
                And the system displays modification records matching the search 'Valid_Iras_Id_Prefix' and filter criteria 'Advanced_Filters_Checkboxes' in the search modifications page
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





